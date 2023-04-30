#!/bin/bash
CONFIG=$HOME/.config
# Array of folder names to copy
folders=("waybar" "wofi" "sway")
B=$PWD

# Loop through each folder in the array
for folder in "${folders[@]}"; do
	# Check if the folder exists in destination folder B
	if [ -d "$PWD/$folder" ]; then
		# If it exists, delete it
		rm -rf "$PWD/$folder"
		echo "Deleted existing folder B/$folder"
	fi

	echo " the folder from source folder A to destination folder B"
	cp -r "$CONFIG/$folder" "$PWD/$folder"
	echo "Copied folder $folder to $B/"
done
