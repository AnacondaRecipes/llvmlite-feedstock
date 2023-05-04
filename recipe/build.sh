#!/bin/bash

set -x

export PYTHONNOUSERSITE=1

export LLVMLITE_USE_CMAKE=1
export LLVMLITE_SHARED=1

$PYTHON -m pip install . --no-deps  --no-build-isolation --ignore-installed -vvv