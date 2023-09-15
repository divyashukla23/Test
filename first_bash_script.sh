#!/bin/bash
# Calculator starts here
echo "Bash scripted calculator"
echo "Enter first number"
read num1
echo "Enter second number"
read num2
# User is entering choice
echo "Select an operation by pressing the sequence key"
echo "1. Addition (+)"
echo "2. Subtraction (-)"
echo "3. Multiplication (*)"
echo "4. Division (/)"
read choice
case $choice in
    1)
        result=$(($num1 + $num2))
        ;;
    2)
        result=$(($num1 - $num2))
        ;;
    3)
        result=$(($num1 * $num2))
        ;;
    4)
        result=$(($num1 / $num2))
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
echo "The result is $result"

