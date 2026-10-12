# 🚀 MeTube Desktop

<div align="center">

![MeTube Desktop Banner](https://img.shields.io/badge/MeTube-Desktop-FF0033?style=for-the-badge&logo=youtube&logoColor=white)
[![Python Version](https://img.shields.io/badge/Python-3.9%20%7C%203.10%20%7C%203.11-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![PyQt6](https://img.shields.io/badge/GUI-PyQt6%20%26%20QtWebEngine-41CD52?style=for-the-badge&logo=qt&logoColor=white)](https://riverbankcomputing.com/software/pyqt/)
[![yt-dlp Powered](https://img.shields.io/badge/Downloader-yt--dlp-FF4500?style=for-the-badge&logo=youtube&logoColor=white)](https://github.com/yt-dlp/yt-dlp)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-blueviolet?style=for-the-badge)](https://github.com/CLPUYIR/metube-desktop)

**The ultimate privacy-first YouTube & YouTube Music desktop client.**  
*All the powerful features of YouTube Mobile brought to your desktop — 100% Free, zero forced sign-ins, zero tracking, and zero terms & conditions to accept.*

[Key Features](#-key-features) • [Installation](#-installation--setup) • [Quick Start](#-quick-start) • [Keyboard Shortcuts](#-keyboard-shortcuts) • [Architecture](#-architecture--how-it-works) • [Building Executable](#-standalone-executable-build)

</div>

---

## 💡 The MeTube Vision

Modern streaming apps are cluttered with unskippable ads, subscription paywalls for basic features like background audio playback, and aggressive tracking that forces users into agreement with endless terms and conditions.

**MeTube Desktop** breaks this paradigm:
- **No Sign-In Demanded**: Browse, listen, watch, and queue content without ever logging into a Google account.
- **Zero Terms & Conditions**: No tracking cookies, no telemetry profiling, no intrusive agreement modals.
- **Premium Features for Free**: Native background audio playback, zero ads, multi-tab streaming, Picture-in-Picture, and high-bitrate media downloads.

---

## ✨ Key Features

### 🛡️ Multi-Tier Ad & Tracker Blocking
- **Network Level Interception**: Native `QWebEngineUrlRequestInterceptor` cuts off ad exchanges, tracking beacons (`doubleclick.net`, `googleads`, `ad.youtube.com`, `video-stats.l.google.com`) before requests hit the network.
- **DOM & Overlay Neutralizer**: Injected CSS and JavaScript cleanse sponsored video suggestions, promo cards, and telemetry popups.
- **Instant Video Ad Skipper**: Fast-forwards and auto-clicks past in-stream ads instantaneously with zero human intervention.

### 🎧 Seamless Background & Minimized Playback
- **True Background Streaming**: Minimizing or closing the window to the system tray keeps audio playing smoothly without lag or stutters.
- **Anti-Throttling Chromium Engine**: Built-in flags (`--disable-background-timer-throttling`, `--disable-renderer-backgrounding`) prevent the OS from sleeping background audio threads.
- **Page Visibility Spoofing**: Patches `document.hidden` and `document.visibilityState` to ensure YouTube never pauses playback when inactive.

### ⬇️ High-Performance `yt-dlp` Media Downloader
- **Direct Stream Extraction**: One-click download for any currently playing music track or video.
- **Multi-Format Audio**: High-definition MP3 (320kbps / 256kbps / 192kbps), Opus (native YouTube audio), lossless FLAC, and M4A/AAC.
- **Full HD & 4K Video**: Download crisp video up to 4K / 1080p / 720p MP4.
- **Automatic ID3 Tagging & Artwork**: Downloads embed artist names, track titles, albums, and high-resolution cover artwork directly into the files.
- **Dedicated Download Manager**: Real-time progress bars, speed monitors, ETA calculations, background threading, and quick folder access.

### 📑 Browser-Grade Multi-Tab Experience
- **Concurrent Tabs**: Stream YouTube Music on one tab while watching educational tutorials or podcasts on another.
- **Smart Audio Arbitrator**: Optional auto-pause prevents conflicting audio when switching between active media tabs.
- **Full Custom Navigation**: Tab reordering, close buttons, responsive URL bar, and custom browser shortcuts.

### 🎛️ System Tray Integration & Mini Player
- **Close-to-Tray Mode**: Keeps your playlist running quietly in the background without cluttering the taskbar.
- **Tray Quick Controls**: Instant Play/Pause, Next Track, Previous Track, and Download from the notification tray context menu.
- **Live Notifications**: Native desktop notifications when track titles and artists change.

---

## 📁 Repository Structure

```
metube-desktop/
├── main.py                     # Application bootstrap & Chromium flag initialization
├── config.py                   # Persistent configuration manager (~/.metube_desktop)
├── create_shortcut.vbs         # Windows desktop shortcut generator
├── requirements.txt            # Project dependencies
├── MeTube-Desktop.spec         # PyInstaller standalone build specification
├── core/
│   ├── __init__.py             # Core package initialization
│   ├── adblocker.py            # Ad-blocking network interceptor & DOM scripts
│   ├── downloader.py           # yt-dlp QThread download engine & DownloadManager
│   ├── media_controller.py     # JS media controls & metadata extraction engine
│   └── web_page.py             # Custom WebEngine page with background playback hooks
├── ui/
│   ├── __init__.py             # UI package initialization
│   ├── main_window.py          # Primary application window & multi-tab manager
│   ├── download_dialog.py      # Format modal & live Download Manager dialog
│   ├── icons.py                # High-DPI programmatic vector icons (QPainter)
│   ├── styles.py               # Modern dark theme stylesheets (QSS)
│   └── tray_icon.py            # Windows notification area & tray menu controls
├── tests/
│   ├── __init__.py
│   └── test_basic.py           # Automated unit tests (config, adblock, UI, fullscreen)
└── .github/
    └── workflows/
        └── build-release.yml   # CI/CD pipeline building Windows standalone binaries
```

---

## 🚀 Installation & Setup

### 1. Prerequisites
- **Python 3.9+** (Python 3.11 recommended)
- **FFmpeg** (Required for audio format transcoding & album art embedding):
  - **Windows**: `winget install Gyan.FFmpeg` or `choco install ffmpeg`
  - **macOS**: `brew install ffmpeg`
  - **Linux**: `sudo apt install ffmpeg`

### 2. Clone the Repository
```bash
git clone https://github.com/CLPUYIR/metube-desktop.git
cd metube-desktop
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Launch MeTube Desktop
```bash
python main.py
```

---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
| :--- | :--- |
| `Ctrl + T` or `Ctrl + M` | Open a new **YouTube Music** tab |
| `Ctrl + Y` | Open a new **YouTube Video** tab |
| `Ctrl + W` | Close the current active tab |
| `Ctrl + Tab` | Switch to the next open tab |
| `Ctrl + Shift + Tab` | Switch to the previous open tab |
| `Ctrl + 1` .. `Ctrl + 9` | Jump directly to tab index 1–9 |
| `Ctrl + D` | Open the Quick Download Dialog |
| `Ctrl + J` | Open the Download Manager Window |
| `Ctrl + L` | Focus the address / search bar |
| `F11` | Toggle immersive Fullscreen mode |
| `Space` | Play / Pause playback |
| `J` / `L` | Seek backward / forward 10 seconds |

---

## ⚙️ Configuration & Data Storage

MeTube Desktop stores persistent settings (volume, download preferences, audio auto-pause behaviors) in a lightweight JSON configuration:
- **Location**: `~/.metube_desktop/settings.json`
- **Cache & Cookies**: `~/.metube_desktop/web_profile/`

> **Note**: If upgrading from an older version, your settings and cookies are automatically migrated seamlessly on startup.

---

## 📦 Standalone Executable Build

To compile a standalone portable Windows `.exe` without needing a Python installation:

```bash
pip install pyinstaller
pyinstaller MeTube-Desktop.spec
```

The compiled standalone executable and runtime libraries will be generated in `dist/MeTube-Desktop/`.

To automatically create a desktop shortcut on Windows:
```bash
cscript create_shortcut.vbs
```

---

## 🧪 Testing

Run the full automated test suite:

```bash
python -m unittest tests/test_basic.py
```

---

## 📄 License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

---

<div align="center">
<sub>Crafted with passion for an open, ad-free, and unrestricted web.</sub>
</div>
