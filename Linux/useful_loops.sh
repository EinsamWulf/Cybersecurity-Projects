#!/bin/bash

sens_files=(
/etc/shadow
/etc/passwd
/etc/hosts
)

for sens in ${sens_files[@]}
	do
	  ls -lah $sens
	done

