#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"
cmake -B build --preset default ${CMAKE_ARGS}
cmake --build build
# ctest --test-dir build
cmake --build build -t install

# Manual installation
mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/lib/modules
cp ${SRC_DIR}/lib/libfluxion-data.so.0.47.0 ${PREFIX}/lib
cp ${SRC_DIR}/lib/libfluxion-data.so.0.47 ${PREFIX}/lib
cp ${SRC_DIR}/lib/libsched-fluxion-resource-module.so ${PREFIX}/lib
cp ${SRC_DIR}/lib/modules/sched-fluxion-resource.so ${PREFIX}/lib/modules
cp ${SRC_DIR}/lib/modules/sched-fluxion-feasibility.so ${PREFIX}/lib/modules
cp ${SRC_DIR}/lib/modules/sched-fluxion-qmanager.so ${PREFIX}/lib/modules
cp ${SRC_DIR}/lib/libreapi_cli.so ${PREFIX}/lib
