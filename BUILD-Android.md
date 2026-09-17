# STRATUM for Android tablets

The Android application shares STRATUM's Qt/QML interface, vehicle model, mission planning, and MAVLink implementation with the desktop application. The initial target is a physical ARM64 tablet in landscape orientation, running Android 9 (API 28) or newer. The install identity is `com.nexam.stratum`; the upstream Java namespace remains unchanged so existing Android integration classes continue to resolve.

## Toolchain

Versions come from `qgroundcontrol/.github/build-config.json`: Qt 6.10.3, NDK 27.2.12479018, compile/target API 35, Android build tools 36.0.0, and JDK 17. A matching Windows Qt host kit supplies the build-time Qt tools. See [Qt's Android setup documentation](https://doc.qt.io/qt-6.10/android-getting-started.html).

Install CMake 3.25+, Git, Python 3, JDK 17, and the matching Qt MSVC host kit first. Then run:

```powershell
.\install-android-toolchain.ps1 -Python 'C:\path\to\python.exe'
```

The installer downloads Qt for Android to `C:\Qt`, Android SDK/NDK to the current user's local Android SDK directory, and Python build tools to `build/android-tools/venv`. It prompts for Android SDK license acceptance; use `-AcceptAndroidLicenses` only after accepting those terms. Both scripts accept explicit Qt, SDK, and JDK paths.

## Build

```powershell
$buildPython = "$PWD\build\android-tools\venv\Scripts\python.exe"
$buildNinja = "$PWD\build\android-tools\venv\Scripts\ninja.exe"
.\build-android.ps1 -Python $buildPython -Ninja $buildNinja -CheckOnly
.\build-android.ps1 -Python $buildPython -Ninja $buildNinja
```

The default is a debug APK for tablet testing. The script prints APK paths only after the package target succeeds. Build output stays in `build/Android-Debug`, separate from desktop builds. CMake and Gradle need network access for dependencies on the first build.

Qt Multimedia is the default video backend in this build entry point. To use GStreamer, install its Android ARM64 SDK and pass `-GStreamerRoot` pointing to the extracted `arm64` directory. Video protocol and decoder compatibility must be checked with the actual camera stream.

`-Configuration Release` builds without a product signing key. Sign that APK with a dedicated STRATUM key before distribution; do not use the upstream QGroundControl release keystore. Windows builds currently inherit the repository's bundled Android OpenSSL fallback; review `cmake/modules/AndroidOpenSSL.cmake` before production distribution.

## Tablet verification

UDP is the primary vehicle connection. Automatic UDP discovery is enabled by default on local port 14550. Connect the tablet and telemetry source to a network that permits peer traffic, then configure the telemetry source to send MAVLink to the tablet's IP address and port 14550. The exact tablet model and Android version have not yet been selected.

Enable USB debugging and install the debug APK using the SDK's `platform-tools/adb.exe install -r <apk-path>`. With multiple devices connected, specify the tablet serial using `-s`.

Verify launch, text scaling, landscape rotation, map interaction, mission editing, and settings persistence on the target tablet. With a simulator, verify telemetry, reconnect behavior, and USB/network permissions. Check video with the intended camera stream, then background/resume behavior and screen sleep. An APK build alone does not establish that desktop-specific panels fit the tablet or that device connections recover correctly.
