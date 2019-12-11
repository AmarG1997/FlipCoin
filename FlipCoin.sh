#!/bin/bash

echo "Welcome To The Flip Coin"

flipCoinResult=$((RANDOM%2))

if [ $flipCoinResult -eq 1 ]
then
	echo "Head"

else
	echo "Tail"
fi
