#!/bin/bash -x

echo "Welcome To The Flip Coin"
read -p "Enter How Many Time You Want To Flip" num
declare -A flipDict


function main()
{
	coin=$1

	for (( j=0; j<$num; j++ ))
	do
		resultVal=$(getCoinValue $coin)
		flipDict[$resultVal]=$(( ${flipDict[$resultVal]} + 1 ))
	done

	for result in ${!flipDict[@]}
	do
		echo ${flipDict[$result]}
		percentage=$(( ${flipDict[$result]} *100 / $num ))
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

echo "Enter 1 for Singlet"
echo "Enter 2 for Doublet"
echo "Enter 3 for Triplet"
read choice

case $choice in

1)
	coin=1
	(main $coin)
	;;
2)
	coin=2
	(main $coin)
	;;
3)
	coin=3
	(main $coin)
	;;
esac





