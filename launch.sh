#!/bin/bash

# Check if Nudge exists before we try anything
if [ ! -f /Applications/Utilities/Nudge.app/Contents/MacOS/Nudge ]; then
    echo "Exiting, Nudge doesn't exist"
    exit 1
fi

# Check if Nudge is currently running
if pgrep -x "Nudge" >/dev/null; then
    echo "Nudge is currently running already"
    exit 1
fi

# Check if we are a sudo user
if [ $(echo "$UID") = "0" ]; then
    SUDO=''
else
    SUDO='sudo -E'
fi

# Assume Nudge exists, continue.

BASE_URL="https://raw.githubusercontent.com/adamApptegy/nudge-config/main/com.github.macadmins.Nudge.json"
TMP_FILE="/tmp/com.github.macadmins.Nudge.json"
TARGET_FILE="/Library/Preferences/com.github.macadmins.Nudge.json"
#Download the latest JSON
/usr/bin/curl -H 'Cache-Control: no-cache' ${BASE_URL} -o ${TMP_FILE}

#Replace the local JSON with the newly downloaded one.
$SUDO /bin/cp ${TMP_FILE} ${TARGET_FILE}

#Remove the temporary file
/bin/rm ${TMP_FILE}

#Launch Nudge in background so job isn't running forever
/Applications/Utilities/Nudge.app/Contents/MacOS/Nudge &
