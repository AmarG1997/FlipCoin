#!/bin/bash

echo "Welcome To The Flip Coin"

read -p "Enter How Many Time You Want To Flip" num

coin=2

declare -A flipDict

function getCoinValue()
{
local coinV=""

for (( i=0; i<$coin; i++ ))
do
		flipResult=$((RANDOM%2))
		if [ $flipResult -eq 1 ]
		then
				coinV="$coinV H"
		else
				coinV="$coinV T"
		fi
	done
		echo $coinV
}

function main()
{
	for (( j=0; j<$num; j++ ))
	do
		resultV=$(getCoinValue)
		flipDict["flipCoin$j"]=$resultV

	done

	for (( k=0; k<${#flipDict[@]}; k++ ))
	do
	echo "FlipCoin $k     ${flipDict[flipCoin$k]}"
	done

}
main

