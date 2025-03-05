#!/bin/bash

set -x

cd ${SRC_DIR}

export PYTHONNOUSERSITE=1

export LLVMLITE_USE_CMAKE=1

# Having two different versions of libLLVM in the same process is causing segfaults, this is 
# achieved in practice by e.g. using Numba->llvmlite->libllvm15.so in the same process as 
# Pytorch->libLLVM19.so (or something else using a different version of LLVM).
# llvmlite is the only package on main having a dependency on llvmdev 15. 
# Statically linking against llvm prevents a point of collision.
# see https://anaconda.atlassian.net/browse/PKG-7254
export LLVMLITE_SHARED=0

$PYTHON -m pip install . --no-deps  --no-build-isolation --ignore-installed -vv