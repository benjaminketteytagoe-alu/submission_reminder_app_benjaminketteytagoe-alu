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
#Logout if the direcctory already exist
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
#Creating the startup script for the reminder app
#!/bin/bash
cat << EOF > "$sub_dir/app/startup.sh"
base_dir="$(dir "$0")/.."
source "$base_dir "$0"/config/config.env"
source "$base_dir "$0"/modules/functions.sh"
bash "$base_dir "$0"/app/reminder.sh"
EOF
# Make startup.sh executable
chmod +x "$sub_dir/app/startup.sh"
echo "The environment '$sub_dir' has been successfully created."
