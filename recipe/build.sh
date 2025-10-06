#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"

# cmake build
cmake -B build --preset default ${CMAKE_ARGS}
cmake --build build

# Do not test on Arch
if [[ -z "${CONDA_BUILD_CROSS_COMPILATION}" ]]; then
  ctest --test-dir build
fi

# cmake installation
cmake --build build --target install

# manual installation
cp ./lib/* ${PREFIX}/lib
