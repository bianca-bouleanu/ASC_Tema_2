#!/bin/bash

./tema2_blas input | grep :| cut -d' ' -f2| cut -d ':' -f1 | sed 'N;s/\n/ /'
