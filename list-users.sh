#!/bin/bash

###################
# Author: Vaibhav
# Version: 1.0
##################

helper()

# Github api url
API_URL="https://github.com"

# Github username and token
USERNAME=$username
TOKEN=$token

# User and Repo information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GITHUB API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GITHUB API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}


# Function to list the users with read access to the repo
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repo
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull==true) | .login')"

    # Display the list of collaboratoes
    if [[ -z "$collaborators" ]]
    then
        echo "No users with read access found"
    else
        echo "Users with read access for ${REPO_OWNER}/${REPO_NAME}"
        echo "$collaborators"
    fi

}

function helper{
    expected_cmd_args=2
    if [[ $# -ne  $expected_cmd_args ]]
    then
        echo "Please execute script with  required cmd args"
        exit 1
    fi
}

# Main Script

echo "Listening users with read access for ${REPO_OWNER}/${REPO_NAME}...."
list_users_with_read_access