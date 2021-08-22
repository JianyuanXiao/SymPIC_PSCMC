#!/bin/bash
cp simd_intrin_config-avx2.scmc simd_intrin_config.scmc
make all_dirs -j8 && make all_headers -j8 && make -j8
