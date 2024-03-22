import os
import sys

def open_utf8(fpath, flags):
    if sys.version_info[0] < 3:
        return open(fpath, flags)
    else:
        return open(fpath, flags, encoding="utf8")

ignore_folders = [
    "src/vendor/cigraph/vendor/glpk",
    "src/vendor/cigraph/vendor/lapack",
    "src/vendor/cigraph/vendor/mini-gmp",
    "src/vendor/cigraph/vendor/f2c",
    "src/vendor/cigraph/etc"
]

def generate_sources(path, name, variable, ignore = [], extensions = ('.c', '.cc', '.cpp', '.f')):
    sources = []
    for root, dirnames, filenames in sorted(os.walk('src' + path)):
        for filename in filenames:
            if filename.endswith(extensions):
                ignore_file = False
                for f in ignore:
                    if root.startswith(f):
                        ignore_file = True
                if ignore_file:
                    continue
                sources.append(os.path.join(root[4:], filename[:filename.rfind('.')] + '.o'))

    text = f"{variable}=" + ' '.join(sorted(sources)) + '\n'

    with open_utf8(os.path.join('src', f'{name}.mk'), 'w') as f:
        f.write(text)

generate_sources('/', 'sources', 'SOURCES', ignore_folders)
generate_sources('/vendor/cigraph/vendor/glpk', 'sources-glpk', 'GLPKSOURCES', [], ('.c', '.cc', '.cpp'))
generate_sources('/vendor/cigraph/vendor/mini-gmp', 'sources-mini-gmp', 'MINIGMPSOURCES')
