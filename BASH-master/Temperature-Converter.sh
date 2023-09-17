#!/bin/bash

# Prompt the user to choose the conversion direction
echo "Choose a conversion:"
echo "1. Fahrenheit to Celsius"
echo "2. Celsius to Fahrenheit"
read -p "Enter 1 or 2: " choice

if [ "$choice" -eq 1 ]; then
  # Conversion from Fahrenheit to Celsius
  read -p "Enter temperature in Fahrenheit: " fahrenheit
  celsius=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc) 
  echo "Temperature in Celsius: $celsius C"
elif [ "$choice" -eq 2 ]; then
  # Conversion from Celsius to Fahrenheit
  read -p "Enter temperature in Celsius: " celsius
  fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
  echo "Temperature in Fahrenheit: $fahrenheit F"
else
  echo "Invalid choice. Please enter 1 or 2."
fi
