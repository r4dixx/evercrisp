#!/bin/bash

#  TODO
# option to copy url to clipboard
# optional upload parameters
# force file parameter to be a file
# help
# verbosity
# optimize

if [[ "$#" == '0' ]]; then

    printf '\nPlease select a file to upload'

elif [[ "$#" == '1' ]]; then

    printf "\nLooking for the best server...\n."
    serverRequest=$(curl https://apiv2.gofile.io/getServer --progress-bar)
    serverStatus=$(echo "$serverRequest" | jq -r '.status')

    if [[ $serverStatus == 'ok' ]]; then

        server=$(echo "$serverRequest" | jq -r '.data|.server')

        printf "\nSelected $server\n"

        printf "\nUploading...\n"
        uploadRequest=$(curl -F file=@"$1" https://"$server".gofile.io/uploadFile --progress-bar)
        uploadStatus=$(echo "$uploadRequest" | jq -r '.status')

        if [[ $uploadStatus == 'ok' ]]; then

            code=$(echo "$uploadRequest" | jq -r '.data|.code')
            adminCode=$(echo "$uploadRequest" | jq -r '.data|.adminCode')
            name=$(echo "$uploadRequest" | jq -r '.data|.file|.name')
            size=$(echo "$uploadRequest" | jq -r '.data|.file|.size')

            printf "\n%s uploaded successfully (%d octets)\n" "$name" "$size"

            printf "\nhttps://gofile.io/d/%s\n" "$code"
            printf "Admin code: %s\n" "$adminCode"

        else

            printf "\nError! Could not upload file. Status: %s\n" "$serverStatus"

        fi

    else

        printf "\nError! Server unavailable. Status: %s\n" "$serverStatus"

    fi

fi
