#!/bin/bash
echo "List of Operators"
echo "Enter 1st number"
read num1
echo "Enter 2nd number"
read num2
echo "Select any option below"
echo "1. Addition (+)"
echo "2. Suntraction (-)"
echo "3. Multiplication (*)"
echo "4. Division (/)"
read choice
case $choice in
        1)
                result=$(($num1+$num2))
                ;;
        2)
                result=$(($num1-$num2))
                ;;
        3)
                result=$(($num1*$num2))
                ;;
        4)
                result=$(($num1/$num2))
                ;;
esac
echo "The result is : $result"

