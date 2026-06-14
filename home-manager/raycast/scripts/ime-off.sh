#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title IME Off
# @raycast.mode silent

osascript -e 'tell application "System Events" to key code 102'
osascript -e 'tell application "System Events" to key code 53'
