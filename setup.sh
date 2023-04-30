#!/bin/bash

# List of folder names to copy
folders=("foot" "waybar" "wofi" "sway")
config=$HOME/.config
# Loop through each folder in the list
for folder in "${folders[@]}"; do
	# Check if folder already exists in B
	if [ -d "$config/$folder" ]; then
		# Check if the homonymous folder contains ".andredot" file
		if [ -f "$config/$folder/.andredot" ]; then
			echo "andredot found, adding .bak termination"
		fi
		if [ -d "$config/${folder}.bak" ]; then
			echo "Found a $config/${folder}.bak, proceeding would destroy the backup. Exiting"
			exit 1
		fi
		# Add .bak termination to the homonymous folder
		mv "$config/$folder" "$config/$folder.bak"
	fi
	echo "$config/$folder not found, not backing up anything"
	# Copy the folder from A to B
	cp -R "$PWD/$folder" "$config/"
done
