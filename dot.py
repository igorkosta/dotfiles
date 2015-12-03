#!/usr/bin/env python3
import os, shutil

home = os.path.expanduser('~')
dotdir = 'dotfiles'

dots = os.path.join(home,dotdir)
print(dots)

if not os.path.exists(dots):
    os.makedirs(dots)

for file in os.listdir(home):
    if file.startswith("."):
        src = os.path.join(home,file)
        dst = os.path.join(dots,file)
        try:
            shutil.move(src, dst)
        except IOError as e:
            print(e)

        try:
            os.symlink(dst, src)
        except Exception:
            print("couldn't link {0} to {1}".format(dst, src))
