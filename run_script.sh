#! /bin/bash

if [[ -z $1 ]]; then
  year=$(date +%Y)
else
  year=$1
fi

Rscript get_dates.R $year

sed "s/^/echo ' ' >> file\n git add file\n/g"  ${year}.commits.txt > ${year}.commits.sh

bash ${year}.commits.sh
