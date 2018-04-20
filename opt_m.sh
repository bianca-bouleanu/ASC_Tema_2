#!/bin/bash

./tema2_opt_m input | grep :| cut -d' ' -f2| cut -d ':' -f1 | sed 'N;s/\n/ /'
