#!/bin/bash

# https://clang.llvm.org/get_started.html

# sudo yum install cmake3.x86_64
# sudo yum install cmake3.x86_64
# sudo yum install clang.x86_64

git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm
make
