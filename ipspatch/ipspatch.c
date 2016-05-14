/*
   This program is hereby released to the public domain.
   ~aaaaaa123456789, 2016-05-01
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>

#define BLOCK_SIZE 8192
#define MINIMUM_RUN 8
#define MAXIMUM_REDUNDANCY 6
// you cannot write a patch block with an offset of 4,542,278 (0x454F46) because it is the end of file marker
#define EOF_MARKER 4542278

struct patch_block {
  unsigned offset;
  unsigned short length;
  char payload[];
};

int main(int, char **);
void usage(const char *);
void patch(const char *, const char *, const char *);
void copy_contents(FILE *, FILE *, unsigned);
struct patch_block * read_patch_block(FILE *);
void apply_patch_block(FILE *, struct patch_block *);
unsigned convert_buffer_to_number(const char *, unsigned char);
void create_patch(const char *, const char *, const char *);
FILE * open_file_checked(const char *, unsigned *);
FILE * open_patch_checked(const char *);
char get_special_value(FILE *, unsigned);
void create_patch_for_data(const char *, const char *, unsigned, unsigned, FILE *, char);
unsigned get_segment_length(const char *, const char *, unsigned, int);
void write_patch_block_for_data(const char *, unsigned, unsigned, FILE *, char);
int check_runs(const char *, unsigned);
void write_value(unsigned, unsigned char, FILE *);
void dump_patch(const char *);
char * read_line(void);
char * trim_string(const char *);
void build_patch(const char *);
int convert_hex_string_to_number(const char *, unsigned char);
void parse_patch_code_line(char *, unsigned, unsigned, FILE *);
unsigned char hex_digit_value(char);

int main (int argc, char ** argv) {
  if (argc < 2) usage(*argv);
  if (!strcmp(argv[1], "patch")) {
    if (argc != 5) usage(*argv);
    patch(argv[2], argv[3], argv[4]);
  } else if (!strcmp(argv[1], "create")) {
    if (argc != 5) usage(*argv);
    create_patch(argv[2], argv[3], argv[4]);
  } else if (!strcmp(argv[1], "dump")) {
    if (argc != 3) usage(*argv);
    dump_patch(argv[2]);
  } else if (!strcmp(argv[1], "build")) {
    if (argc != 3) usage(*argv);
    build_patch(argv[2]);
  } else
    usage(*argv);
  return 0;
}

void usage (const char * program_name) {
  fprintf(stderr, "usage:\n"
                  "  creating a patch: %s create <file1> <file2> <output.ips>\n"
                  "  applying a patch: %s patch <file> <patch.ips> <result>\n"
                  "  dumping  a patch: %s dump <patch.ips> (dumps code to stdout)\n"
                  "  building a patch: %s build <patch.ips> (reads code from stdin)\n",
          program_name, program_name, program_name, program_name);
  exit(1);
}

void error_and_exit (const char * error, ...) {
  va_list ap;
  va_start(ap, error);
  vfprintf(stderr, error, ap);
  exit(1);
}

void patch (const char * source, const char * patch_file, const char * output) {
  unsigned file_length;
  FILE * source_file = open_file_checked(source, &file_length);
  FILE * patch_fp = open_patch_checked(patch_file);
  FILE * target_file = fopen(output, "wb+");
  copy_contents(target_file, source_file, file_length);
  fclose(source_file);
  struct patch_block * block;
  while (!feof(patch_fp)) {
    block = read_patch_block(patch_fp);
    if (!block) break;
    apply_patch_block(target_file, block);
    free(block);
  }
  fclose(patch_fp);
  fclose(target_file);
}

void copy_contents (FILE * destination, FILE * source, unsigned length) {
  char buf[BLOCK_SIZE];
  unsigned next;
  while (length) {
    next = (length > BLOCK_SIZE) ? BLOCK_SIZE : length;
    !fread(buf, 1, next, source);
    fwrite(buf, 1, next, destination);
    length -= next;
  }
}

struct patch_block * read_patch_block (FILE * fp) {
  char buf[5];
  unsigned offset, length;
  if (fread(buf, 1, 5, fp) < 5) return NULL;
  offset = convert_buffer_to_number(buf, 3);
  if (offset == EOF_MARKER) return NULL;
  length = convert_buffer_to_number(buf + 3, 2);
  struct patch_block * result = malloc(sizeof(struct patch_block) + (length ? length : 3));
  result -> offset = offset;
  result -> length = length;
  if (!length) length = 3;
  if (fread(result -> payload, 1, length, fp) < length) {
    free(result);
    return NULL;
  }
  return result;
}

void apply_patch_block (FILE * file, struct patch_block * block) {
  fseek(file, block -> offset, 0);
  if (block -> length) {
    fwrite(block -> payload, 1, block -> length, file);
    return;
  }
  unsigned length = convert_buffer_to_number(block -> payload, 2);
  char fill = block -> payload[2];
  void * buffer = malloc(length);
  memset(buffer, fill, length);
  fwrite(buffer, 1, length, file);
  free(buffer);
}

unsigned convert_buffer_to_number (const char * buffer, unsigned char length) {
  unsigned result;
  unsigned char p;
  for (p = result = 0; p < length; p ++) result = (result << 8) | ((unsigned char) buffer[p]);
  return result;
}

void create_patch (const char * from, const char * to, const char * output) {
  unsigned first_length, second_length;
  FILE * first_file = open_file_checked(from, &first_length);
  FILE * second_file = open_file_checked(to, &second_length);
  if (first_length > second_length) error_and_exit("error: first file %s is larger than second file %s\n", from, to);
  FILE * patch_file = fopen(output, "wb");
  if (!patch_file) error_and_exit("error: cannot open %s for writing\n", output);
  fwrite("PATCH", 1, 5, patch_file);
  char buffer1[BLOCK_SIZE];
  char buffer2[BLOCK_SIZE];
  unsigned p, next;
  char special = get_special_value(first_file, first_length);
  for (p = 0; p < first_length; p += BLOCK_SIZE) {
    next = first_length - p;
    if (next > BLOCK_SIZE) next = BLOCK_SIZE;
    !fread(buffer1, 1, next, first_file);
    !fread(buffer2, 1, next, second_file);
    create_patch_for_data(buffer1, buffer2, next, p, patch_file, special);
  }
  fclose(first_file);
  if (first_length < second_length) {
    next = second_length - first_length;
    void * data = malloc(next);
    !fread(data, 1, next, second_file);
    write_patch_block_for_data(data, next, first_length, patch_file, special);
    free(data);
  }
  fclose(second_file);
  fwrite("EOF", 1, 3, patch_file);
  fclose(patch_file);
}

FILE * open_file_checked (const char * file, unsigned * file_length) {
  FILE * fp = fopen(file, "rb");
  if (!fp) error_and_exit("error: cannot open %s for reading\n", file);
  if (fseek(fp, 0, 2)) error_and_exit("error: cannot seek on %s\n", file);
  long length = ftell(fp);
  if (length < 0)
    error_and_exit("error: cannot determine length of %s\n", file);
  else if (length > 16777216)
    error_and_exit("error: %s is larger than 16 MB\n", file);
  if (file_length) *file_length = length;
  rewind(fp);
  return fp;
}

FILE * open_patch_checked (const char * patch_file) {
  FILE * fp = fopen(patch_file, "rb");
  if (!fp) error_and_exit("error: cannot open %s for reading\n", patch_file);
  char buf[5];
  if ((fread(buf, 1, 5, fp) != 5) || memcmp(buf, "PATCH", 5)) error_and_exit("error: %s is not a valid patch file\n", patch_file);
  return fp;
}

char get_special_value (FILE * fp, unsigned length) {
  if (length < EOF_MARKER) return 0;
  long pos = ftell(fp);
  fseek(fp, EOF_MARKER - 1, 0);
  char result;
  !fread(&result, 1, 1, fp);
  fseek(fp, pos, 0);
  return result;
}

void create_patch_for_data (const char * first_buffer, const char * second_buffer, unsigned length, unsigned offset, FILE * output, char special) {
  unsigned pos = 0;
  unsigned block, next;
  while (pos < length) {
    if (first_buffer[pos] == second_buffer[pos]) {
      pos += get_segment_length(first_buffer + pos, second_buffer + pos, length - pos, 1);
      continue;
    }
    block = 0;
    next = 0;
    do {
      block += next;
      block += get_segment_length(first_buffer + pos + block, second_buffer + pos + block, length - pos - block, 0);
      next = get_segment_length(first_buffer + pos + block, second_buffer + pos + block, length - pos - block, 1);
    } while (((pos + block) < length) && (next < MAXIMUM_REDUNDANCY));
    write_patch_block_for_data(second_buffer + pos, block, offset + pos, output, special);
    pos += block;
  }
}

unsigned get_segment_length (const char * first_buffer, const char * second_buffer, unsigned length, int kind) {
  // 0: differing, 1: equal
  unsigned pos;
  for (pos = 0; (pos < length) && ((first_buffer[pos] == second_buffer[pos]) == kind); pos ++);
  return pos;
}

void write_patch_block_for_data (const char * data, unsigned length, unsigned offset, FILE * output, char special) {
  if (!length) return;
  if (offset == EOF_MARKER) {
    char * buf = malloc(length + 1);
    *buf = special;
    memcpy(buf + 1, data, length);
    write_patch_block_for_data(buf, length + 1, EOF_MARKER - 1, output, special);
    free(buf);
    return;
  }
  unsigned run;
  for (run = 1; (run < length) && (data[run] == *data); run ++);
  if ((offset != EOF_MARKER) && (run >= MINIMUM_RUN)) {
    if (run > 32767) run = 32767;
    write_value(offset, 3, output);
    write_value(0, 2, output);
    write_value(run, 2, output);
    write_value(*data, 1, output);
    write_patch_block_for_data(data + run, length - run, offset + run, output, special);
    return;
  }
  unsigned current, remainder;
  if (length < 32768) {
    current = length;
    remainder = 0;
  } else {
    current = 32767;
    remainder = length - 32767;
  }
  int run_pos = check_runs(data, current);
  if (run_pos > 0) {
    remainder += current - run_pos;
    current = run_pos;
    if ((offset + current) == EOF_MARKER) {
      remainder --;
      current ++;
    }
  }
  write_value(offset, 3, output);
  write_value(current, 2, output);
  fwrite(data, 1, current, output);
  if (remainder) write_patch_block_for_data(data + current, remainder, offset + current, output, special);
}

int check_runs (const char * data, unsigned length) {
  unsigned pos, cmp;
  if (length < MINIMUM_RUN) return -1;
  for (pos = 0; pos <= (length - MINIMUM_RUN); pos ++) {
    for (cmp = 0; (cmp < MINIMUM_RUN) && (data[pos] == data[pos + cmp]); cmp ++);
    if (cmp >= MINIMUM_RUN) return pos;
  }
  return -1;
}

void write_value (unsigned value, unsigned char length, FILE * file) {
  char buf[16];
  unsigned char p;
  for (p = 0; p < length; p ++) buf[p] = (value >> (8 * (length - p - 1))) & 255;
  fwrite(buf, 1, length, file);
}

void dump_patch (const char * patch_file) {
  FILE * fp = open_patch_checked(patch_file);
  struct patch_block * block;
  while (!feof(fp)) {
    block = read_patch_block(fp);
    if (!block) break;
    printf("%06x:", block -> offset);
    if (block -> length) {
      unsigned p;
      for (p = 0; p < block -> length; p ++) printf(" %02hhx", block -> payload[p]);
      putchar('\n');
    } else
      printf(" %04x * %02hhx\n", convert_buffer_to_number(block -> payload, 2), block -> payload[2]);
    free(block);
  }
  fclose(fp);
}

char * read_line (void) {
  int character;
  char * result = NULL;
  unsigned length = 0;
  while (1) {
    character = getchar();
    if ((character == EOF) || (character == '\n')) break;
    result = realloc(result, length + 1);
    result[length ++] = character;
  }
  result = realloc(result, length + 1);
  result[length] = 0;
  return result;
}

char * trim_string (const char * string) {
  if (!string) return NULL;
  char * result = malloc(strlen(string) + 1);
  while (isspace(*string)) string ++;
  if (!*string) {
    *result = 0;
    return result;
  }
  unsigned last = strlen(string);
  while (isspace(string[last - 1])) last --;
  strncpy(result, string, last);
  result[last] = 0;
  return result;
}

void build_patch (const char * patch_file) {
  FILE * fp = fopen(patch_file, "wb");
  if (!fp) error_and_exit("error: could not open %s for writing\n", patch_file);
  fwrite("PATCH", 1, 5, fp);
  char * line;
  char * split;
  char * address_line;
  unsigned line_number = 0;
  int address;
  while (!feof(stdin)) {
    line = read_line();
    line_number ++;
    if (!(line && *line)) goto comment;
    if (*line == ':') goto comment;
    split = strchr(line, ':');
    if (!split) goto comment;
    *split = 0;
    address_line = trim_string(line);
    address = convert_hex_string_to_number(address_line, 6);
    if (address < 0)
      fprintf(stderr, "warning: line %u: address %s is not valid\n", line_number, line);
    else if (address == EOF_MARKER)
      fprintf(stderr, "warning: line %u: address matches end-of-file marker 0x%06x\n", line_number, EOF_MARKER);
    else
      parse_patch_code_line(split + 1, address, line_number, fp);
    free(address_line);
    comment:
    free(line);
  }
  fwrite("EOF", 1, 3, fp);
  fclose(fp);
}

int convert_hex_string_to_number (const char * string, unsigned char limit) {
  if (!(string && *string)) return -1;
  unsigned long min_overflow = 1UL << (4 * limit);
  char * errp;
  unsigned long converted = strtoul(string, &errp, 16);
  if (*errp) return -1;
  if (converted >= min_overflow) return -1;
  return converted;
}

void parse_patch_code_line (char * contents, unsigned address, unsigned line_number, FILE * output) {
  char * split = strchr(contents, '*');
  char * tmp;
  if (split) {
    int length, data;
    *split = 0;
    tmp = trim_string(contents);
    length = convert_hex_string_to_number(tmp, 4);
    free(tmp);
    tmp = trim_string(split + 1);
    data = convert_hex_string_to_number(tmp, 2);
    free(tmp);
    if ((length < 0) || (data < 0)) {
      fprintf(stderr, "warning: line %u: invalid contents for address 0x%06x\n", line_number, address);
      return;
    }
    write_value(address, 3, output);
    write_value(0, 2, output);
    write_value(length, 2, output);
    write_value(data, 1, output);
    return;
  }
  unsigned char * buf = malloc(65536);
  unsigned char last_digit = 255;
  unsigned length = 0;
  for (; *contents; contents ++) {
    if (isspace(*contents)) continue;
    if (!isxdigit(*contents)) {
      fprintf(stderr, "warning: line %u: invalid contents for address 0x%06x\n", line_number, address);
      free(buf);
      return;
    }
    if (last_digit == 255)
      last_digit = hex_digit_value(*contents);
    else {
      buf[length ++] = (last_digit << 4) | hex_digit_value(*contents);
      if (length > 65535) {
        fprintf(stderr, "warning: line %u: invalid contents for address 0x%06x\n", line_number, address);
        free(buf);
        return;
      }
      last_digit = 255;
    }
  }
  write_value(address, 3, output);
  write_value(length, 2, output);
  fwrite(buf, 1, length, output);
  free(buf);
}

unsigned char hex_digit_value (char digit) {
  if (digit < 'A') return digit - 48;
  return (digit & ~32) - 55;
}
