import os
import sys
import fnmatch

def open_utf8(fpath, flags):
    if sys.version_info[0] < 3:
        return open(fpath, flags)
    else:
        return open(fpath, flags, encoding="utf8")

with open_utf8(os.path.join('tools', 'Makevars.conf.in'), 'r') as f:
     text = f.read()

ignore_folders = [
    "src/vendor/cigraph/vendor/glpk",
    "src/vendor/cigraph/vendor/lapack",
    "src/vendor/cigraph/vendor/mini-gmp",
    "src/vendor/cigraph/vendor/f2c",
    "src/build"
]

sources = []
for root, dirnames, filenames in os.walk('src'):
    for filename in filenames:
        if filename.endswith(('.c', '.cc', '.cpp')):
            ignore_file = False
            for f in ignore_folders:
                if root.startswith(f):
                    ignore_file = True
            if ignore_file:
                continue
            sources.append(os.path.join(root[4:], filename[:filename.rfind('.')] + '.o'))

text = text.replace('{{ SOURCES }}', ' '.join(sources))

with open_utf8(os.path.join('src', 'Makevars.in'), 'w') as f:
     f.write(text)
