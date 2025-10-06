#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"
cmake -B build --preset default ${CMAKE_ARGS}
cmake --build build
# ctest --test-dir build
cmake --build build --target install

# Manual installation
mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/lib/modules
cp ./lib/libfluxion-data.so.0.47.0 ${PREFIX}/lib
cp ./lib/libfluxion-data.so.0.47 ${PREFIX}/lib
cp ./lib/libsched-fluxion-resource-module.so ${PREFIX}/lib
cp ./lib/modules/sched-fluxion-resource.so ${PREFIX}/lib/modules
cp ./lib/modules/sched-fluxion-feasibility.so ${PREFIX}/lib/modules
cp ./lib/modules/sched-fluxion-qmanager.so ${PREFIX}/lib/modules
cp ./lib/libreapi_cli.so ${PREFIX}/lib
