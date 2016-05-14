from sys import argv

def split_base_stats(file):
	lines = open(file).readlines()
	filename = None
	start_line = 0
	for id, line in enumerate(lines):
		if "BaseData::" in line:
			if filename:
				open(filename, "w+").write("".join(lines[start_line:(id-1)]))
			filename = "data/base_stats/" + line.split("BaseData")[0].lower() + ".asm"
			start_line = id + 1
	open(filename, "w+").write("".join(lines[start_line:-1]))

def repl_with_includes(file):
	lines = open(file).readlines()
	building_file = []
	for line in lines:
		if "BaseData" in line:
			building_file.append(line)
			if "BaseData::" in line:
				filename = "data/base_stats/" + line.split("BaseData")[0].lower() + ".asm"
				building_file.append("INCLUDE \"" + filename + "\"\n\n")
	open(file, "w+").write("".join(building_file))

if __name__ == "__main__":
	if argv[1] == "split":
		split_base_stats(argv[2])
	elif argv[1] == "include":
		repl_with_includes(argv[2])