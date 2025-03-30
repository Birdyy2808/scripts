#!/bin/bash
#
#########
#Author: Vaibhav
#Version: 1.0
#########

set -exo pipefail

API_URL="https://www.google.com"

function google_get_api {
        local endpoint="$1"
        local url="${API_URL}/${endpoint}"

        echo "Getting the values from the url"
        curl -sL  "${url}" > output.html

}

function provide_argument {
        local endpoint="imghp?hl=en&authuser=0&ogbl"

        echo "Calling the function"
        finalURL="$(google_get_api "${endpoint}")"



}

# Calling the main function
provide_argument