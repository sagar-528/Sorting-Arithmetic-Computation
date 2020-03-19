#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#reading the value
read -p "Enter first number :" number1
read -p "Enter second number :" number2
read -p "Enter third number :" number3

#computing problems
result1=`echo "scale=3; $number1+$number2*$number3" | bc`
result2=`echo "scale=3; $number1*$number2+$number3" | bc`
result3=`echo "scale=3; $number3+$number1/$number2" | bc`
result4=`echo "scale=3; $number1%$number2+$number3" | bc`

#storing results in dictionary
arithmeticDictionary[1]=$result1
arithmeticDictionary[2]=$result2
arithmeticDictionary[3]=$result3
arithmeticDictionary[4]=$result4

#Dictionary into array
for value in  ${!arithmeticDictionary[@]}
do 
	array[value]="${arithmeticDictionary[$value]}"
done

#result in descending order
echo "Sorted array in descending order"
for counter1 in ${!array[@]}
do
	for counter2 in ${!array[@]}
	do
		if (( `echo "${array[$counter1]} > ${array[$counter2]}"| bc -q` == 1 ))		#-q is Quiet from bc. 
		then
			temp="${array[$counter1]}"
			array[$counter1]="${array[$counter2]}"
			array[$counter2]=$temp
		fi
	done
done

echo "${array[@]}"
