#!/bin/bash

# Script for converting velocity fields into text
# files that can be read by nav_cor code.
#
# Raul Valenzuela
# May, 2015


# input cfradial folder
#-------------------------------
# CFDIR="$HOME/P3_v2/cfrad/c03/leg01_cor"
CFDIR="$HOME/P3_v2/cfrad/c03/leg03_cor"
# CFDIR="$HOME/P3_v2/cfrad/c03/leg05_cor"
# CFDIR="$HOME/P3_v2/cfrad/c03/leg14_cor"

# CFDIR="$HOME/P3_v2/cfrad/c04/leg10_cor"
# CFDIR="$HOME/P3_v2/cfrad/c04/leg11_cor"

# output text folders
#-------------------------------
CXDIR="${CFDIR/cfrad/cfradTxt}"
CXDIR_VE="$CXDIR/VE"
CXDIR_VG="$CXDIR/VG"

# check existence of directories
#------------------------------------------------
cf_flag=true
if [ ! -d $CFDIR ]; then
	cf_flag=false
fi

cx_flag=true
if [ ! -d $CXDIR ]; then
	cx_flag=false
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
fi

echo
echo " Running netcdf2text in $CFDIR"
echo " and writing to $CXDIR"
cd $CFDIR
echo "-----------------------------"
echo " Converting VE"
echo "-----------------------------"
netcdf2text DZ VE
mv *.txt $CXDIR_VE
# echo "-----------------------------"
# echo " Converting VG"
# echo "-----------------------------"
# netcdf2text DZ VG
# mv *.txt $CXDIR_VG
echo " Done"
echo



