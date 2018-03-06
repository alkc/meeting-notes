#!/usr/bin/env bash
# meeting-notes: v 1.0  2018/03/06 12:02:00 dcat
# Author: Alexander Koc <alkc@protonmail.com>
# http://github.com/alkc/meeting-notes
#
# Description: Personal script for keeping meeting notes. 
# Nothing fancy at all. Just creates a markdown file from 
# a template and opens it in Typora

display_usage() {
    echo "Create a markdown file in current working directory with template for meeting notes and open it in typora."
    echo -e "\nUsage:\t$0 name"
}

open_notes() {
    typora $1 &
}

info_msg() {
    echo "[INFO] $1"
}

if [ $# -eq 0 ]
  then
      display_usage
      exit 0
fi

# Main script:
filename_base=$1

filename_curr_date="$(date '+%Y%m%d_%H%M')"
curr_date="$(date '+%Y-%m-%d %H:%M')"
filename="${filename_curr_date}_${filename_base}.md"

if [ -f ${filename} ]
then
    info_msg "Oho. File already exists: ${filename}"
    info_msg "Opening it..."
    open_notes ${filename}
    exit 0
fi

info_msg "Creating new file: ${filename}"
touch ${filename}

# TODO: Move the blob below to some template.md
echo "# ${filename_base}" >> ${filename}
echo "" >> ${filename}
echo "## Details" >> ${filename}
echo "" >> ${filename}
echo -e "Project:\t\t  " >> ${filename}
echo -e "Date:\t\t${curr_date}  " >> ${filename}
echo -e "Location:\t\t  " >> ${filename}
echo -e "Duration:\t\t  " >> ${filename}
echo -e "### Meeting participants" >> ${filename}
echo "Person 1 (Affiliation), Person 2 (Affiliation), ..." >> ${filename}
echo "## Summary" >> ${filename}
echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..." >> ${filename}
echo "## Meeting notes" >> ${filename}
echo "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat..." >> ${filename}

open_notes ${filename}
exit 0

