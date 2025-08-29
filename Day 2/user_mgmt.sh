#!/bin/bash
#Day 2 of 100 days of devops
#Author: arceuzvx

LOGFILE="user_mgmt.log"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

# Function to create a user
create_user() {
    read -p "Enter the username to create: " username
    read -p "Enter the group for this user: " group
    read -p "Enter account expiry date (YYYY-MM-DD): " expiry

    if id "$username" &>/dev/null; then
        echo "User $username already exists!"
        log_action "Attempted to create existing user $username"
        return
    fi

    # Create group if not exists
    if ! getent group "$group" &>/dev/null; then
        groupadd "$group"
        log_action "Created group $group"
    fi

    # Create user with home dir, group, expiry
    useradd -m -g "$group" -e "$expiry" "$username"
    if [ $? -eq 0 ]; then
        echo "User $username created in group $group with expiry $expiry."
        log_action "Created user $username in group $group with expiry $expiry"
    else
        echo "Failed to create user $username."
        log_action "Failed to create user $username"
    fi
}

# Function to delete a user + their group if empty
delete_user() {
    read -p "Enter the username to delete: " username

    if ! id "$username" &>/dev/null; then
        echo "User $username does not exist!"
        log_action "Attempted to delete non-existing user $username"
        return
    fi

    group=$(id -gn "$username")

    read -p "Are you sure you want to delete user $username (and possibly group $group)? (y/n): " confirm
    if [[ "$confirm" == "y" ]]; then
        userdel -r "$username"
        if [ $? -eq 0 ]; then
            echo "User $username deleted."
            log_action "Deleted user $username"

            # Delete group if now empty
            if [ "$(getent group "$group" | awk -F: '{print $4}')" == "" ]; then
                groupdel "$group"
                echo "Group $group deleted (empty)."
                log_action "Deleted group $group (empty)"
            fi
        else
            echo "Failed to delete user $username."
            log_action "Failed to delete user $username"
        fi
    else
        echo "Aborted."
        log_action "Aborted deletion of $username"
    fi
}

# Menu loop
while true; do
    echo ""
    echo "==== User Management Menu ===="
    echo "1. Create user"
    echo "2. Delete user (and group if empty)"
    echo "3. Exit"
    read -p "Choose an option [1-3]: " choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) echo "Exiting..."; log_action "Exited script"; exit 0 ;;
        *) echo "Invalid choice" ;;
    esac
done
