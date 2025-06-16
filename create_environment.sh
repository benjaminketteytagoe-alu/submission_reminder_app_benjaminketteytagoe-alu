#!/bin/bash
#This creates a prompt for the user to input their name
read -p "Kindly Enter your name here: " myname
# Validating myname input
if [[ -z "$myname" ]]; then
	echo "Your inout can not be empty! Please enter your name"
	exit 1
fi
#Creating project root directory plus user's input name
sub_dir="submission_reminder_$myname"
#Logout if the directory already exist
if [[ -d "$sub_dir" ]]; then
	echo "Please directory '$sub_dir' already exist"
	exit 1
fi
# Indicating the environment is being created
echo "Creating environment....Loading!!"
#Creating directory structure for the environment
mkdir -p "$sub_dir/app" "$sub_dir/modules" "$sub_dir/assets" "$sub_dir/config"
#This creates the files in their respective directories
#Creating the file for the app directory
touch "$sub_dir/app/reminder.sh" "$sub_dir/modules/functions.sh" "$sub_dir/assets/submissions.txt" "$sub_dir/config/config.env"
#Populate the various files with their respective content
#for the reminder.sh
cat << EOF >> "$sub_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
#for the functions.sh
cat << EOF >> "$sub_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
#For the config.env
cat << EOF >> "$sub_dir/config/config.env"
#This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
#For the submission.txt file and added plus five entries
cat << EOF >> "$sub_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Benjamin, Shell Navigation, submitted
Gideon, Git, not submitted
Naurine, Python Functions, submitted
Lisa, Git, not submitted
Adeleke, Web Development, submitted
Ademola, Node.js,submitted
EOF
#Make the scripts executable
chmod +x "$sub_dir/app/reminder.sh" "$sub_dir/modules/functions.sh"
#Creating the startup script for the reminder app
#!/bin/bash
cat << EOF > "$sub_dir/startup.sh"
base_dir="$(dir "$0")/.."
source "$base_dir "$0"/config/config.env"
source "$base_dir "$0"/modules/functions.sh"
bash "$base_dir "$0"/app/reminder.sh"
EOF
# Make startup.sh executable
chmod +x "$sub_dir/startup.sh"
echo "The environment '$sub_dir' has been successfully created."
