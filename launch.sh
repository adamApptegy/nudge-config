#!/bin/zsh

# Check if Nudge exists before we try anything
if [ ! -f /Applications/Utilities/Nudge.app/Contents/MacOS/Nudge ]; then
    echo "Exiting, Nudge doesn't exist"
    exit 1
fi

# Assume Nudge exists, continue scripting.

#Download the latest JSON
#curl something tmp

#Replace the local JSON with the newly downloaded one.
#cp old .. new

#Remove the temporary file
#rm tmp

#Launch Nudge