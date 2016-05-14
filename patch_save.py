#!/usr/bin/python3
from sys import argv
import os

sBackupGameData = 0x1209
sGameData = 0x2009
SaveFileSize = 0xb7a
sBackupChecksum = 0x1f0d
sChecksum = 0x2d0d
s251CheckBit = 0x2013
sBackup251CheckBit = 0x1213

def compute_checksum(chunk):
    return (sum(chunk) & 0xffff).to_bytes(2, 'little')

def get_save_file(file, pointer, size):
    with open(file, 'rb') as F:
        return F.read()[pointer : (pointer + size)]

def write_save_file(file, pointer, data):
    with open(file, 'r+b') as F:
        F.seek(pointer)
        F.write(data)

def main():
    assert len(argv) > 1
    assert all([os.path.exists(file) for file in argv[1:]])
    for file in argv[1:]:
        write_save_file(file, s251CheckBit, b"\x00")
        savefile = get_save_file(file, sGameData, SaveFileSize)
        checksum = compute_checksum(savefile)
        write_save_file(file, sChecksum, checksum)
        write_save_file(file, sBackup251CheckBit, b"\x00")
        backupsavefile = get_save_file(file, sBackupGameData, SaveFileSize)
        checksum = compute_checksum(backupsavefile)
        write_save_file(file, sBackupChecksum, checksum)

if __name__ == "__main__":
    try:
        main()
    except AssertionError:
        print("patch_save.py [file1] ([file2] [file3] ...)")
