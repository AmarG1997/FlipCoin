#!/bin/bash -x

echo "Welcome To The Flip Coin"

read -p "Enter How Many Time You Want To Flip" numberOfFlips
declare -A flipResultDict

function getFlipPercentage()
{
	coin=$1

	for (( j=0; j<$numberOfFlips; j++ ))
	do
		resultVal=$(getCoinValue $coin)
		flipResultDict[$resultVal]=$(( ${flipResultDict[$resultVal]} + 1 ))
	done

	for result in ${!flipResultDict[@]}
	do
		echo ${flipResultDict[$result]}
		percentage=$(( ${flipResultDict[$result]} *100 / $numberOfFlips ))
		echo $result"	"$percentage"%"
	done | sort -k2 -nr | awk 'NR==1{print ($1"	"$2)}'
}

function getCoinValue()
{
	coin=$1
	local coinVal=""

	for (( i=0; i<$coin; i++ ))
	do

		flipResult=$((RANDOM%2))
		if [ $flipResult -eq 1 ]
		then
			coinVal=$coinVal"H"
		else
			coinVal=$coinVal"T"
		fi
	done

	echo $coinVal
}

function main()
{
	echo "Enter 1 for Singlet"
	echo "Enter 2 for Doublet"
	echo "Enter 3 for Triplet"
	read choice

	case $choice in

	1)
		coin=1
		(getFlipPercentage $coin)
		;;
	2)
		coin=2
		(getFlipPercentage $coin)
		;;
	3)
		coin=3
		(getFlipPercentage $coin)
		;;
	esac
}

main

