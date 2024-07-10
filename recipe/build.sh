#!/bin/bash
export LDFLAGS="${LDFLAGS} -lboost_system -lboost_graph -lboost_filesystem -lboost_regex"
export CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-maybe-uninitialized -I${PREFIX}/include -I${PREFIX}/include/boost"
cmake ${CMAKE_ARGS} .

make V=1

# Do not test on Arch
if [[ -z "${CONDA_BUILD_CROSS_COMPILATION}" ]]; then
  export FLUX_TESTS_LOGFILE=t
  make check
fi

make install
