#!/bin/bash

idris -p contrib -p effects SegFaultTester.idr --interface -o segFaultTester.o --cg-opt "-g"

gcc  main.c segFaultTester.o -o testIt `idris --include` `idris --link` -lprotobuf-c -g -I.

./testIt