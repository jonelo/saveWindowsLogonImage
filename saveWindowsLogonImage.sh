#!/bin/bash
#
# Saves the current Windows logon image to the user's desktop
#
# Copyright 2019 Johann N. Loefflmann
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

WINFILE=$(/mnt/c/Windows/System32/reg.exe query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Creative" /s /f "landscapeImage" | grep landscapeImage | tail -n 1 | awk '{ print $3 }')
if [ -z "$WINFILE" ]; then
  printf "No logon image found. Exit.\n"
  exit
fi
printf "Windows file: %s\n" "$WINFILE"

LINUXFILE=$(echo "$WINFILE" | tr -d '\r' | tr '\\' '/' | sed -e 's/C:/\/mnt\/c/g' )
printf "Linux file: %s\n" "$LINUXFILE"

FILENAME=${LINUXFILE##*/}
PREFIX="/mnt/c/Users/"
USER=${LINUXFILE:${#PREFIX}} # cut the prefix /mnt/c/Users/
USER=${USER%%/*} # remove everything from the end until slash

cp "$LINUXFILE" "/mnt/c/Users/${USER}/Desktop/${FILENAME}.jpg"

