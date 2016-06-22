PYTHON := python2
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean crystal crystal11 beesafree patches ipspatch
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py


crystal_obj := \
wram.o \
main.o \
mobile.o \
home.o \
audio.o \
maps.o \
events.o \
credits.o \
egg_moves.o \
evos_attacks.o \
pokedex.o \
crystal_misc.o \
pics.o

crystal11_obj := $(crystal_obj:.o=11.o)

beesafree_obj := $(crystal_obj:.o=_ai.o)

all_obj := $(sort $(crystal_obj) $(crystal11_obj) $(beesafree_obj))

roms := pokecrystal.gbc pokecrystal11.gbc pokecrystal_ai.gbc

all: $(roms)
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc
beesafree: pokecrystal_ai.gbc
patches: ipspatch pokecrystal11.ips pokecrystal_ai.ips
ipspatch: ipspatch/ipspatch.exe

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) $(roms:.gbc=.ips)

%.asm: ;
%.txt: ;
%.c: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ $<

%_ai.o: dep = $(shell $(includes) $(@D)/$*.asm)
%_ai.o: %.asm $$(dep)
	rgbasm -D BEESAFREE -o $@ $<

%11.o: dep = $(shell $(includes) $(@D)/$*.asm)
%11.o: %.asm $$(dep)
	rgbasm -D CRYSTAL11 -o $@ $<

%.ips: %.gbc
	ipspatch/ipspatch create baserom.gbc $< $@

pokecrystal11.gbc: $(crystal11_obj)
	rgblink -n pokecrystal11.sym -m pokecrystal11.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n pokecrystal.sym -m pokecrystal.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_ai.gbc: $(beesafree_obj)
	rgblink -n pokecrystal_ai.sym -m pokecrystal_ai.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

%.exe: %.c
	gcc -O3 -Wno-unused-result $< -o $@

%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
#%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

