#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Please provide a YouTube live stream URL."
    echo "Usage: yt-live-record <URL> [max_height]"
    echo "Example: yt-live-record https://youtube.com/live/xxxxxx 720"
    exit 1
fi

URL="$1"
# Default to 720p if no resolution is specified
HEIGHT="${2:-720}"

TIMESTAMP=$(date +"%m%d-%H%M%S")
if [[ "$(uname)" == "Darwin" ]]; then
    OUTPUT_DIR="$HOME/Desktop"
else
    OUTPUT_DIR="$HOME/Videos"
    mkdir -p "$OUTPUT_DIR"
fi
OUTPUT_PATH="${OUTPUT_DIR}/Class_${TIMESTAMP}.mp4"

echo "========================================"
echo "Preparing to record live stream with streamlink..."
echo "Source URL: $URL"
echo "Target Max Resolution: ${HEIGHT}p"
echo "Output path: $OUTPUT_PATH"
echo "To stop recording early and save the file, press [Ctrl + C]"
echo "========================================"

streamlink -o "$OUTPUT_PATH" "$URL" "${HEIGHT}p,best"

echo "Recording finished! File saved to: $OUTPUT_PATH"
