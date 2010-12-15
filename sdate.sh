#!/bin/sh 
# vim: set ts=2 sw=2 sts=2 et si ai: 

# sdate.sh 
# =-=
# 2010, StrategyLabs!
# Andres Aquino <andres.aquino@gmail.com>
# All rights reserved.
# 

function getNumberDay () {
  local year=${1}
  local month=${2}
  local day=${3}
  local number=
  
  month=$(((month+9)%12))
  year=$((year-(month/10)))
  number=$(((365*year) + (year/4) - (year/100) + (year/400) + (month*306 + 5)/10 + (day -1)))

  echo $number
}

function getDayOfNumber () {
  local number=${1}
  local year=
  local month=
  local day=
 
  year=$(((10000*number+14780)/3652425))
  day=$((number-((365*year)+(year/4)-(year/100)+(year/400))))
  if [ ${day} -lt 0 ]
  then
    year=$((year-1))
    day=$((number-((365*year)+(year/4)-(year/100)+(year/400))))
  fi
  pmnth=$((((100*day)+52)/3060))
  month=$((((pmnth+2)%12)+1))
  year=$((year+(pmnth+2)/12))
  day=$((day-((pmnth*306+5)/10)+1))
  echo "${year} ${month} ${day}"

}

echo "Current date: `date '+%Y%m%d'`"
year=`date '+%Y'`
month=`date '+%m'`
day=`date '+%Y'`
numberday=$(getNumberDay ${year} ${month} ${day}) 
#daysto=20
#numberday=$((numberday-$daysto))
echo $(getDayOfNumber "$numberday")

# 
