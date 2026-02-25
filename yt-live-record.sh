#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Please provide a YouTube live stream URL."
    echo "Usage: ./record_class.sh <URL> [max_height]"
    echo "Example: ./record_class.sh https://youtube.com/live/xxxxxx 720"
    exit 1
fi

URL="$1"
# Default to 720p if no resolution is specified
HEIGHT="${2:-720}"

# yt-dlp format string: best video up to specified height + best audio, fallback to best single file
FORMAT="bv*[height<=$HEIGHT]+ba/b[height<=$HEIGHT]/b"

TIMESTAMP=$(date +"%m%d-%H%M%S")
if [[ "$(uname)" == "Darwin" ]]; then
    OUTPUT_DIR="$HOME/Desktop"
else
    OUTPUT_DIR="$HOME/Videos"
    mkdir -p "$OUTPUT_DIR"
fi
OUTPUT_PATH="${OUTPUT_DIR}/Class_${TIMESTAMP}.mp4"

echo "========================================"
echo "Preparing to record live stream with yt-dlp..."
echo "Source URL: $URL"
echo "Target Max Resolution: ${HEIGHT}p"
echo "Output path: $OUTPUT_PATH"
echo "To stop recording early and save the file, press [Ctrl + C]"
echo "========================================"

# Execute yt-dlp download and force mp4 output
yt-dlp -f "$FORMAT" --merge-output-format mp4 -o "$OUTPUT_PATH" "$URL"

echo "Recording finished! File saved to: $OUTPUT_PATH"
