#!/bin/bash

# Bash script to compile the navigation correction code

rm netcdf2text

NETCDF="/usr/local"

FLIB="-L$NETCDF/lib -lnetcdf -lnetcdff -lcurl -lhdf5 -lhdf5_hl"

FINC="-I$NETCDF/include -I/usr/include/geotiff"

# for home
# CLIB="-L/usr/lib -lgeotiff -ltiff -L/usr/local/lib"

# for work
CLIB="-lgeotiff -ltiff"

CINC="-I/usr/include/geotiff"

gfortran -g -o netcdf2text netcdf2text.f90 $FLIB $FINC
