#!/bin/sh

BEG=124
END=149

# ccqserv100.in2p3.fr is the master
# and xrootd start faster is master is started last
for i in $(seq $BEG $END| tac); do
    printf "ccqserv${i}.in2p3.fr\n" $i
done
