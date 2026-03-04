# YouTube Live Stream Recorder

A simple shell script to record YouTube live streams using [yt-dlp](https://github.com/yt-dlp/yt-dlp).

## Features

- Records any YouTube live stream to an MP4 file
- Configurable maximum resolution (defaults to 720p)
- Saves the file to `~/Desktop` (macOS) or `~/Videos` (Linux) with a timestamp in the filename
- Gracefully stop recording early with `Ctrl + C` — the partial file is saved
- Automatically strips backslashes from URLs (common when pasting from chat apps)

## Requirements

- **yt-dlp** — the core download/recording engine
- **ffmpeg** — required by yt-dlp for merging video and audio streams

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/rogerfan48/yt-live-record.git
cd yt-live-record
chmod +x yt-live-record.sh
```

### 2. Install dependencies

**macOS:**
```bash
brew install yt-dlp ffmpeg
```

**Linux (all distros):**
```bash
pip install yt-dlp
sudo apt install ffmpeg   # Debian/Ubuntu
# or: sudo pacman -S ffmpeg   # Arch
# or: sudo dnf install ffmpeg  # Fedora
```

### 3. (Optional) Install globally

Create a symlink so you can run the script from anywhere. Because it's a symlink, `git pull` will automatically reflect the latest version without re-linking:

```bash
sudo ln -s "$(pwd)/yt-live-record.sh" /usr/local/bin/yt-live-record
```

---

## Migrating from streamlink

If you previously used the streamlink-based version, uninstall streamlink (optional) and install the new dependencies:

**macOS:**
```bash
brew uninstall streamlink
brew install yt-dlp ffmpeg
```

**Linux:**
```bash
pip uninstall streamlink
pip install yt-dlp
sudo apt install ffmpeg   # Debian/Ubuntu
```

The symlink (`/usr/local/bin/yt-live-record`) does not need to be recreated — it still points to the same script file.

---

## Usage

```
yt-live-record <URL> [max_height]
```

| Argument     | Required | Description                                      |
|--------------|----------|--------------------------------------------------|
| `URL`        | Yes      | Full YouTube live stream URL                     |
| `max_height` | No       | Maximum video height in pixels (default: `720`)  |

### Examples

Record at the default resolution (720p):
```bash
yt-live-record https://youtube.com/live/xxxxxx
```

Record at up to 1080p:
```bash
yt-live-record https://youtube.com/live/xxxxxx 1080
```

Record at 480p to save disk space:
```bash
yt-live-record https://youtube.com/live/xxxxxx 480
```

### Output

The recorded file is saved with a timestamp in the filename:

| Platform | Path                              |
|----------|-----------------------------------|
| macOS    | `~/Desktop/Class_MMDD-HHMMSS.mp4` |
| Linux    | `~/Videos/Class_MMDD-HHMMSS.mp4`  |

To stop recording early and keep what has been captured, press `Ctrl + C`.

---

## Updating

### Script

```bash
git pull
```

### yt-dlp

```bash
# macOS
brew upgrade yt-dlp

# Linux
pip install -U yt-dlp
```

---

## License

MIT
