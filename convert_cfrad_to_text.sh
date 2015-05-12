#!/bin/bash

# Script for converting velocity fields into text
# files that can be read by nav_cor code.
#
# Raul Valenzuela
# May, 2015


# input cfradial folder
#-------------------------------
CFDIR="$HOME/P3_v2/cfrad/c03/leg03_cor"

# output text folders
#-------------------------------
CXDIR="${CFDIR/cfrad/cfradTxt}"
CXDIR_VE="$CXDIR/VE"
CXDIR_VG="$CXDIR/VG"
CXDIR_VU="$CXDIR/VU"

# check existence of directories
#------------------------------------------------
if [ ! -d $CFDIR ]; then
	cf_flag=false
else
	cf_flag=true
fi

if [ ! -d $CXDIR ]; then
	cx_flag=false
else
	cx_flag=true
fi


# Processing
#---------------------------
if [ "$cf_flag" = false ]; then
	echo "$CFDIR does not exit "
	echo
	exit
fi

if [ "$cx_flag" = false ]; then
	mkdir -p $CXDIR_VE
	mkdir -p $CXDIR_VG
	mkdir -p $CXDIR_VU
fi

echo
echo " Running netcdf2text in $CFDIR"
echo " and writing to $CXDIR"
echo
cd $CFDIR
netcdf2text DZ VE
mv *.txt $CXDIR_VE
netcdf2text DZ VG
mv *.txt $CXDIR_VG
netcdf2text DZ VU
mv *.txt $CXDIR_VU
echo " Done"
echo



