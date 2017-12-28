#!/usr/bin/env python

import os
import sys

config_map = {}

def map_config(source_dir, site_config):
    global config_map
    source_dir = os.path.realpath(source_dir)
    source_dir = os.path.normcase(source_dir)
    site_config = os.path.normpath(site_config)
    config_map[source_dir] = site_config

# Variables configured at build time.
llvm_source_root = "E:/LLVM/src"
llvm_obj_root = "E:/LLVM/build_mingw"

# Make sure we can find the lit package.
sys.path.insert(0, os.path.join(llvm_source_root, 'utils', 'lit'))

# Set up some builtin parameters, so that by default the LLVM test suite
# configuration file knows how to find the object tree.
builtin_parameters = { 'build_mode' : "." }


map_config('E:/LLVM/src/projects/libcxx/test/lit.cfg', 'E:/LLVM/build_mingw/projects/libcxx/test/lit.site.cfg')
map_config('E:/LLVM/src/projects/compiler-rt/test/builtins/lit.cfg', 'E:/LLVM/build_mingw/projects/compiler-rt/test/builtins/lit.site.cfg')
map_config('E:/LLVM/src/tools/polly/test/lit.cfg', 'E:/LLVM/build_mingw/tools/polly/test/lit.site.cfg')
map_config('E:/LLVM/src/tools/polly/test/Unit/lit.cfg', 'E:/LLVM/build_mingw/tools/polly/test/Unit/lit.site.cfg')
map_config('E:/LLVM/src/tools/clang/test/lit.cfg.py', 'E:/LLVM/build_mingw/tools/clang/test/lit.site.cfg.py')
map_config('E:/LLVM/src/tools/clang/test/Unit/lit.cfg.py', 'E:/LLVM/build_mingw/tools/clang/test/Unit/lit.site.cfg.py')
map_config('E:/LLVM/src/tools/lld/test/lit.cfg', 'E:/LLVM/build_mingw/tools/lld/test/lit.site.cfg')
map_config('E:/LLVM/src/tools/lld/test/Unit/lit.cfg', 'E:/LLVM/build_mingw/tools/lld/test/Unit/lit.site.cfg')
map_config('E:/LLVM/src/utils/lit/tests/lit.cfg', 'E:/LLVM/build_mingw/utils/lit/lit.site.cfg')
map_config('E:/LLVM/src/test/lit.cfg.py', 'E:/LLVM/build_mingw/test/lit.site.cfg.py')
map_config('E:/LLVM/src/test/Unit/lit.cfg.py', 'E:/LLVM/build_mingw/test/Unit/lit.site.cfg.py')

builtin_parameters['config_map'] = config_map

if __name__=='__main__':
    from lit.main import main
    main(builtin_parameters)
