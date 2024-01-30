#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"
cmake --prefix=${PREFIX} ${CMAKE_ARGS} .

make V=1

export FLUX_TESTS_LOGFILE=t
make check
make install
