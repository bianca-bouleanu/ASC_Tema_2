#!/bin/bash

./tema2_opt_f input | grep :|cut -d' ' -f2| cut -d ':' -f1 | sed 'N;s/\n/ /'
