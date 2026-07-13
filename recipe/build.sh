#!/bin/bash

set -x

# CMake Error at CMakeLists.txt:46 (message):
# LLVM CMake export states LLVM version is 20, llvmlite only officially
# supports 22.
# +++++++++++++++
# Having two different versions of libLLVM in the same process is causing segfaults, this is 
# achieved in practice by e.g. using Numba->llvmlite->libllvm22.so in the same process as
# Pytorch->libLLVM19.so (or something else using a different version of LLVM).
# llvmlite is the only package on main having a dependency on llvmdev 22.
# Statically linking against llvm prevents a point of collision.
# see https://anaconda.atlassian.net/browse/PKG-7254
export LLVMLITE_SHARED=0

$PYTHON -m pip install . --no-deps  --no-build-isolation --ignore-installed -vv