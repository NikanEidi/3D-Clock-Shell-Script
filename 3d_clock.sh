#!/opt/homebrew/bin/bash

# Check if the Bash version supports associative arrays
if [[ "${BASH_VERSINFO[0]}" -lt 4 ]]; then
  echo "Error: This script requires Bash 4.0 or later."
  exit 1
fi

# ASCII art for digits stored in an associative array
declare -A digits=(
  [0]="
 ██████╗ 
██╔═████╗
██║██╔██║
████╔╝██║
╚██████╔╝
 ╚═════╝ "
  [1]="
  ██╗    
 ███║    
 ╚██║    
  ██║    
  ╚═╝    "
  [2]="
 ██████╗ 
 ╚════██╗
  █████╔╝
 ██╔═══╝ 
 ███████╗
 ╚══════╝"
  [3]="
 ██████╗ 
 ╚════██╗
  █████╔╝
  ╚═══██╗
 ██████╔╝
 ╚═════╝ "
  [4]="
 ██╗  ██╗
 ██║  ██║
 ███████║
 ╚════██║
      ██║
      ╚═╝"
  [5]="
 ███████╗
 ██╔════╝
 █████╗  
 ╚═══██╗ 
 ██████╔╝
 ╚═════╝ "
  [6]="
  ██████╗ 
 ██╔════╝ 
 █████╗   
 ██╔═══╝  
 ╚██████╗ 
  ╚═════╝ "
  [7]="
 ███████╗
 ╚════██║
     ██╔╝
    ██╔╝ 
    ██║  
    ╚═╝  "
  [8]="
  █████╗  
 ██╔══██╗ 
 ╚█████╔╝ 
 ██╔══██╗ 
 ╚█████╔╝ 
  ╚════╝  "
  [9]="
  █████╗  
 ██╔══██╗ 
 ╚██████║ 
  ╚═══██║ 
  █████╔╝ 
  ╚════╝  "
  [:]="
         
    ██╗  
    ╚═╝  
    ██╗  
    ╚═╝  
         "
)


# Function to display the full time
display_time() {
  local time="$1"
  local lines=6
  for ((line=0; line<lines; line++)); do
    for ((i=0; i<${#time}; i++)); do
      char="${time:$i:1}"
      # Remove trailing spaces and avoid newlines
      echo -n "$(echo "${digits[$char]}" | sed -n "$((line + 1))p")  "
    done
    echo  # Add a single newline after each line of the ASCII art
  done
}

# Display the clock once
current_time=$(date +"%H:%M:%S")
display_time "$current_time"
