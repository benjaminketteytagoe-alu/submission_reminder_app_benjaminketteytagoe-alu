#!/bin/bash
#This creates a prompt for the user to input their name
read -p "Kindly Enter your name here: " myname
# This creates the submission_reminder plus the users name with the main directories to each 
sub_dir="submission_reminder_$myname"
mkdir -p "$sub_dir/app" "$sub_dir/modules" "$sub_dir/assets" "$sub_dir/config" 
#This creates the files in their respective directories
#Creating the file for the app directory
touch "$sub_dir/app/reminder.sh" "$sub_dir/modules/functions.sh" "$sub_dir/assets/submissions.txt" "$sub_dir/config/config.env"
echo "The files have been successfully created inside their respective directories"
