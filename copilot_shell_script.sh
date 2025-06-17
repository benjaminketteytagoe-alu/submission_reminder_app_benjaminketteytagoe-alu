#!/bin/bash

# This copilot_shell_script.sh - Updates assignment name and reruns reminder app
# Find submission reminder directory
app_path=$(ls -d submission_reminder_* 2>/dev/null | head -1)
#Handling errors if the directory is not found
if [[ -z "$app_path" ]]; then
    echo "Error: No submission_reminder directory found!"
    exit 1
fi
echo "==========YOU ARE WELCOME TO SUBMIT YOUR ASSIGNMENT========"
echo "Using directory: $app_path"

# Check config file exists
config_file="$app_path/config/config.env"
if [[ ! -f "$config_file" ]]; then
    echo "Error: Config file not found!"
    exit 1
fi

# Showing the  current assignment
current_assignment=$(sed -n '2p' "$config_file" | cut -d'=' -f2 | tr -d '"')
echo "Current assignment: $current_assignment"

# This allows student to input new assignment name
read -p "Enter new assignment name: " new_assignment

if [[ -z "$new_assignment" ]]; then
    echo "Assignment name cannot be empty!"
    exit 1
fi

# Update assignment using sed (row 2)
sed -i "2s/ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"
echo "Assignment updated to: $new_assignment"

# Run startup.sh
cd "$app_path"
./startup.sh

echo "======CONGRATULATIONS ON SUBMITTING YOUR ASSIGNMENT!!!!======="
