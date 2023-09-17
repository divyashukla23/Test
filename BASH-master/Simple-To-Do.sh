# Bash script for a simple to-do list manager that allows users to add, remove, and list
#!/bin/bash

# Initialize an empty array to store tasks
tasks=()

# Function to add a task to the list
add_task() {
  local task="$1"
  tasks+=("$task")
  echo "Task added: $task"
}

# Function to remove a task from the list
remove_task() {
  local index="$1"
  if [ "$index" -ge 0 ] && [ "$index" -lt "${#tasks[@]}" ]; then
    local removed_task="${tasks[$index]}"
    unset "tasks[$index]"
    tasks=("${tasks[@]}")
    echo "Task removed: $removed_task"
  else
    echo "Invalid task index."
  fi
}

# Function to list all tasks
list_tasks() {
  if [ "${#tasks[@]}" -eq 0 ]; then
    echo "No tasks to display."
  else
    echo "Task List:"
    for ((i = 0; i < ${#tasks[@]}; i++)); do
      echo "$i: ${tasks[$i]}"
    done
  fi
}

# Main task manager loop
while true; do
  # Display menu
  echo "To-Do List Manager:"
  echo "1. Add Task"
  echo "2. Remove Task"
  echo "3. List Tasks"
  echo "4. Quit"
  read -p "Enter your choice (1/2/3/4): " choice

  case "$choice" in
    1)
      read -p "Enter task: " new_task
      add_task "$new_task"
      ;;
    2)
      list_tasks
      read -p "Enter the index of the task to remove: " remove_index
      remove_task "$remove_index"
      ;;
    3)
      list_tasks
      ;;
    4)
      echo "Exiting the To-Do List Manager."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please enter 1, 2, 3, or 4."
      ;;
  esac
done
