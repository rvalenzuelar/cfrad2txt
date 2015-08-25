#!/bin/bash

# Bash script to compile the navigation correction code

rm netcdf2text

NETCDF="/usr/local"

FLIB="-L$NETCDF/lib -lnetcdf -lnetcdff -lcurl -lhdf5 -lhdf5_hl"

FINC="-I$NETCDF/include -I/usr/include/geotiff"

gfortran -g -o netcdf2text netcdf2text.f90 $FLIB $FINC
