# Bash script for a basic calculator with a history feature that allows users to perform addition, subtraction, multiplication, and division operations, as well as recall previous calculations:
#!/bin/bash

# Initialize variables
history=()
result=""

# Function to perform calculations
perform_calculation() {
  local expression="$1"
  result=$(bc <<< "scale=2; $expression")
}

# Function to display history
display_history() {
  echo "Calculation History:"
  for ((i = 0; i < ${#history[@]}; i++)); do
    echo "$(($i + 1)): ${history[$i]}"
  done
}

# Main calculator loop
while true; do
  # Prompt the user for a calculation or quit
  read -p "Enter a calculation (e.g., 5 + 3) or 'q' to quit: " input

  # Check if the user wants to quit
  if [ "$input" == "q" ]; then
    break
  fi

  # Check if the input is empty
  if [ -z "$input" ]; then
    echo "Invalid input. Please enter a calculation or 'q' to quit."
    continue
  fi

  # Perform the calculation
  perform_calculation "$input"

  # Store the calculation in history
  history+=("$input = $result")

  # Display the result
  echo "Result: $result"

  # Ask the user if they want to see the history
  read -p "Do you want to see the history? (y/n): " show_history

  if [ "$show_history" == "y" ]; then
    display_history
  fi
done

echo "Calculator closed."
