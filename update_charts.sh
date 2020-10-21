#!/bin/bash

JOBLOG=/var/log/sysadmin/stock.log
WORK_DIR=/var/stock
RUBY=/opt/ruby/current/bin/ruby
PYTHON=/opt/python/current/bin/python
STOCKTXT=$WORK_DIR/data/stocks.txt
STARTDATE=2014-10-01
DAYS=240

cd $WORK_DIR/data

echo -n "*** $0: Job started on `/bin/hostname` at ">>$JOBLOG 2>&1
date "+%Y/%m/%d %T">>$JOBLOG 2>&1

$PYTHON $WORK_DIR/bin/charts.py -s $STOCKTXT -d $STARTDATE -y $DAYS>>$JOBLOG 2>&1
$PYTHON $WORK_DIR/bin/summary.py>>$JOBLOG 2>&1

echo -n "*** $0: Job ended on `/bin/hostname` at ">>$JOBLOG 2>&1
date "+%Y/%m/%d %T">>$JOBLOG 2>&1
echo>>$JOBLOG 2>&1

exit 0
