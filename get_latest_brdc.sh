#!/bin/bash 
set -eu

## get Current year
current_year=$(date +%Y)

## get latest version
latest_version=$(wget -4 -qO- "ftp://cddis.gsfc.nasa.gov/gnss/data/daily/$current_year/brdc/" | awk -F'/brdc*/' '/brdc*/{print $2}' | cut -d\" -f1 | grep -v '\index.html' | tail -1)

## download 
wget -4 "ftp://cddis.gsfc.nasa.gov/gnss/data/daily/$current_year/brdc/$latest_version"

## uncompress
uncompress -f $latest_version