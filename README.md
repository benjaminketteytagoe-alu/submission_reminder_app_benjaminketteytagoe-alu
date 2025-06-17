# submission_reminder_app_benjaminketteytagoe-alu
This is an individual summative project that seek to utilize scripting to automate a process that reminds students of their submission date. 
### Below is the summary of how to run the project and everything the project entails
## My Learning Objectives
This project helped me to achieve the following learning outcomes:

1. **Master Shell Scripting Basics:** I developed proficiency and challenged me in writing and executing shell scripts to automate tasks such as directory creation, file manipulation, and application initialization.

2. **Understand Application Directory Structures:** I understood the importance of organizing files into appropriate directories for better maintainability and scalability.

3. **Develop Problem-Solving and Debugging Skills:** Also, I enhanced my ability to troubleshoot and debug scripts by testing their implementation and resolving errors. I also exercised the power of collaboration though it was an individual project I seeked for help from colleagues and I learned new things.

4. **Gain Experience with Version Control and Documentation:** I used version control systems to manage and submit my work, and I wrote clear and concise documentation for future referencing.

5. **Build a Functional Application from Scratch:** Last but not least I gained experience in how to integrate multiple components to create a working application and simulate a real-world development workflow.
6. **Precise Research:** Again, I experienced indepth research when I run into errors and started debugging and this skill helped me greatly to find solutions.

## Project Overview

This application consists of two main shell scripts:

1. **`create_environment.sh`** : This script sets up the environment for the application with proper directory structure
2. **`copilot_shell_script.sh`** : This script allows updating assignment names and reruns the reminder system

## Features

- **Automated Environment Setup**: Creates complete directory structure with all necessary files
- **Student Submission Tracking**: Monitors submission status from the submissions.txt file
- **Dynamic Assignment Updates**: Easily change assignment names and rerun checks
- **Reminder Reports**: Shows students who haven't submitted assignments and give the period left for deadline date
- **Simple and Effective**: concise and precise scripts that accomplished their purpose

## Installation & Setup
### Quick Start

1. **Make scripts executable**
```bash
chmod +x create_environment.sh copilot_shell_script.sh
```

2. **Create the application environment**
```bash
./create_environment.sh
```
   - Enter your name when prompted
   - This creates a directory named `submission_reminder_{withYourName}`
   - All necessary files and directories are created automatically

3. **Test the application**
```bash
cd submission_reminder_{withYourName}
./startup.sh
```

## How to Run the Application

### Step 1: Environment Setup

Run the environment creation script:
```bash
./create_environment.sh
```

When prompted, enter your name. This will create a directory structure like by doing `tree` command you should have this structure:
```
submission_reminder_{withYourName}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── config/
│   └── config.env
├── assets/
│   └── submissions.txt
└── startup.sh
```

### Step 2: Run the Main Application

Navigate to your created directory and run the startup script:
```bash
cd submission_reminder_{withYourName}
./startup.sh
```

This will:
- Load the current assignment from `config/config.env`
- Check `submissions.txt` for students who haven't submitted
- Display reminders for students with "not submitted" status

### Step 3: Update Assignment Names

To check submissions for a different assignment:
```bash
./copilot_shell_script.sh
```

This script will:
- Show the current assignment name
- Prompt you to enter a new assignment name
- Update the configuration file
- Automatically rerun the reminder application

## File Structure Explained

### `config/config.env`
Contains application configuration:
```bash
#This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```

### `assets/submissions.txt`
Student submission data in CSV format:
```
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
```

### `app/reminder.sh`
Main application logic that:
- Sources configuration and functions
- Calls the submission checking function
- Displays assignment information

### `modules/functions.sh`
Contains the `check_submissions` function that:
- Reads the submissions file
- Filters for the current assignment
- Shows students who haven't submitted

### `startup.sh`
Simple launcher script that runs the main application

## Understanding the Code

### Environment Creation Script
The `create_environment.sh` script demonstrates:
- User input validation
- Directory creation with `mkdir -p`
- File population using `cat << 'EOF'`
- Setting executable permissions with `chmod +x`

### Assignment Update Script
The `copilot_shell_script.sh` script shows:
- Finding directories with pattern matching
- Text manipulation using `sed`
- File reading and validation
- Script execution workflow

## Testing the Application

1. **Test with Default Data**: Run `./startup.sh` to see students who haven't submitted "Shell Navigation"

2. **Test Assignment Updates**: Use `./copilot_shell_script.sh` to change to "Git" and see different results

3. **Add More Students**: Edit `assets/submissions.txt` to add more test data

## Troubleshooting

### Common Issues You are likely to face when running

**"No submission_reminder directory found"**
- Solution: Run `./create_environment.sh` first

**"Permission denied"**
- Solution: Make scripts executable with `chmod +x *.sh`
**NB: Always ensure you are in the right directory**
  
### Git Branching Strategy

1. **Feature Branch**: Use `feature/setup` for development
2. **Main Branch**: I Kept the repo clean with only required files:
   - `create_environment.sh`
   - `copilot_shell_script.sh`
   - `README.md`

### Version Control Commands

```bash
# This creates and switches to the feature/setup branch
git checkout -b feature/setup

# Added all the files in branch and committed changes
git add .
git commit -m "Add environment setup script"

# I switched to main branch and merge
git checkout main
git merge feature/setup

# Pushed to repository
git push origin main
```

## Repository Structure

This is my final GitHub repository with the only instructed files:
```
submission_reminder_app_benjaminketteytagoe-alu
├── create_environment.sh
├── copilot_shell_script.sh
└── README.md
```
**Skills I Demonstrated included few to mention**: Shell Scripting, File Management, Application Architecture, Version Control
