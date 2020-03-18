#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

read -p "Enter first number :" a
read -p "Enter second number :" b
read -p "Enter third number :" c

echo "scale=3; $a+$b*$c" | bc
echo "scale=3; $a*$b+$c" | bc
echo "scale=3; $c+$a/$b" | bc
echo "scale=3; $a%$b+$c" | bc

