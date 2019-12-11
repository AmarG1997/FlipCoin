#!/bin/bash

echo "Welcome To The Flip Coin"

flipCoinResult=$((RANDOM%2))

read -p "Enter How Many Times U Want To Flip Coin" num
head=0
tail=0

declare -A flipDict

for (( i=1;i<=$num;i++))
do
	flipCoin=$((RANDOM%2))
	if [ $flipCoin -eq 1 ]
	then
	head=$(($head+1))
	flipDict["flipCoin$i"]="head"
	else
	tail=$(($tail+1))
	flipDict["flipCoin$i"]="tail"
	fi
done

echo "head : "$head
echo "Tail : "$tail
for(( i=1; i<=${#flipDict[@]}; i++ ))
do
	echo "FlipCoin $i     ${flipDict[flipCoin$i]}"
done
