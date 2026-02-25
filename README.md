# YouTube Live Stream Recorder

A simple shell script to record YouTube live streams using [streamlink](https://streamlink.github.io).

## Features

- Records any YouTube live stream to an MP4 file
- Configurable maximum resolution (defaults to 720p)
- Saves the file to `~/Desktop` (macOS) or `~/Videos` (Linux) with a timestamp in the filename
- Gracefully stop recording early with `Ctrl + C` — the partial file is saved

## Requirements

- **streamlink** — the core streaming engine

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
brew install streamlink
```

**Linux (all distros):**
```bash
pip install streamlink
```

### 3. (Optional) Install globally

Create a symlink so you can run the script from anywhere. Because it's a symlink, `git pull` will automatically reflect the latest version without re-linking:

```bash
sudo ln -s "$(pwd)/yt-live-record.sh" /usr/local/bin/yt-live-record
```

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

### streamlink

```bash
# macOS
brew upgrade streamlink

# Linux
pip install -U streamlink
```

---

## License

MIT
