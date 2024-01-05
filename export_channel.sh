#!/bin/bash

# Prompt user to input channel IDs
read -p $'\033[0;30mEnter the Channel ID (press Enter after each ID, and type "done" when finished):\033[0m ' channel_ids_input

# Create an array to store channel IDs
channel_ids=()

# Read channel IDs until "done" is entered
while [ "$channel_ids_input" != "done" ]; do
    channel_ids+=("$channel_ids_input")
    read -p $'\033[0;30mEnter the next Channel ID (or type "done"): \033[0m' channel_ids_input
done

# Loop through each channel ID and run export commands
for channel_id in "${channel_ids[@]}"; do
    echo -e "\033[0;30mExporting channel $channel_id...\033[0m"
    kolibri manage exportchannel "$channel_id" /home/laroc/Desktop/KOLIBRI_DATA
    echo -e "\033[0;30mExporting content for channel $channel_id...\033[0m"
    kolibri manage exportcontent "$channel_id" /home/laroc/Desktop/KOLIBRI_DATA
done

# Display success message
echo -e "\033[0;32mExport completed successfully.\033[0m"

