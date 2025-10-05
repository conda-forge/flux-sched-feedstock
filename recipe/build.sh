#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"
cmake -B build --preset default ${CMAKE_ARGS}
cmake --build build
ctest --test-dir build
cmake --build build -t install --prefix ${PREFIX}
ls $PREFIX/lib/flux
ls $PREFIX/lib
