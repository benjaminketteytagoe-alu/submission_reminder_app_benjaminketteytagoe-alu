#!/bin/bash
#This prompts the user to enter the assignment name
read -p "Kindly Enter the assignment name: " my_assignment_name
# Update the assignment in the config.env file
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=${my_assignment_name}/" "./config/config.env"
