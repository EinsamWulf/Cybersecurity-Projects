#!/bin/bash

num=(0 1 2 3 4 5 6 7 8 9)
fav_state=('TEXAS' 'TEXAS' 'TEXAS' 'TEXAS' 'TEXAS')
list_it=$(ls)

for nums in ${num[@]}
	do 
	  if [ $nums = 3 ] || [ $nums = 5 ] || [ $nums = 7 ]
	  then 
	   echo $nums
	  fi
	done

for fav_states in ${fav_state[@]}
	do
	  if [ $fav_states == 'TEXAS' ]
	  then 
	    echo 'YOURE GODDAMNED RIGHT'
	  else
	    echo 'THE CORRECT ANSWER IS TEXAS'
	  fi
	done

for list in ${list_it[@]}
	do 
	 echo $list
	done

suids=$(find / -type f perm /4000 2> dev/null)

for y in ${suids[@]}
	do
	  echo $y
	done


