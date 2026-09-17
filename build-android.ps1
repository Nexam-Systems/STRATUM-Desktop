# Build the shared STRATUM Qt application for a physical ARM64 Android tablet.
[CmdletBinding()]
param(
    [string]$QtRoot = 'C:\Qt',
    [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$JavaHome = $env:JAVA_HOME,
    [string]$Python = 'python',
    [string]$Ninja = 'ninja',
    [string]$GStreamerRoot = '',
    [ValidateSet('Debug', 'Release')][string]$Configuration = 'Debug',
    [ValidateRange(1, 64)][int]$Jobs = 4,
    [switch]$CheckOnly
)

$ErrorActionPreference = 'Stop'
$sourceDir = Join-Path $PSScriptRoot 'qgroundcontrol'
$config = Get-Content (Join-Path $sourceDir '.github/build-config.json') -Raw | ConvertFrom-Json
$qtTarget = Join-Path $QtRoot "$($config.qt_version)/android_arm64_v8a"
$qtHost = Join-Path $QtRoot "$($config.qt_version)/msvc2022_64"
$ndk = Join-Path $AndroidSdk "ndk/$($config.ndk_full_version)"
$buildDir = Join-Path $PSScriptRoot "build/Android-$Configuration"
if (-not $JavaHome) { $JavaHome = 'C:\Program Files\Java\jdk-17' }

$missing = [System.Collections.Generic.List[string]]::new()
$required = [ordered]@{
    'Qt Android toolchain' = "$qtTarget/lib/cmake/Qt6/qt.toolchain.cmake"
    'Qt host tools' = "$qtHost/bin/moc.exe"
    'Android NDK' = "$ndk/build/cmake/android.toolchain.cmake"
    'Android platform' = "$AndroidSdk/platforms/android-$($config.android_platform)/android.jar"
    'Android build tools' = "$AndroidSdk/build-tools/$($config.android_build_tools)/aapt2.exe"
    'JDK compiler' = "$JavaHome/bin/javac.exe"
}
foreach ($entry in $required.GetEnumerator()) {
    if (-not (Test-Path -LiteralPath $entry.Value)) {
        $missing.Add("$($entry.Key): $($entry.Value)")
    }
}
foreach ($tool in @('cmake', 'git', $Python, $Ninja)) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) { $missing.Add("Executable: $tool") }
}
if ($GStreamerRoot -and -not (Test-Path "$GStreamerRoot/lib/pkgconfig/gstreamer-1.0.pc")) {
    $missing.Add("GStreamer ARM64 SDK: $GStreamerRoot")
}
if ($missing.Count) {
    Write-Host "Android build prerequisites missing:"
    $missing | ForEach-Object { Write-Host "  $_" }
    throw 'Install the listed prerequisites; see BUILD-Android.md.'
}
& $Python -c 'import jinja2'
if ($LASTEXITCODE -ne 0) { throw 'The selected Python needs jinja2.' }
Write-Host "Android build prerequisites found. Target: ARM64, API $($config.android_min_sdk)+."
if ($CheckOnly) { return }

# Scope environment changes to this script invocation, including failure paths.
$savedEnvironment = @{}
foreach ($name in @('JAVA_HOME', 'ANDROID_HOME', 'ANDROID_SDK_ROOT', 'ANDROID_NDK_ROOT', 'PATH')) {
    $savedEnvironment[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
try {
    $env:JAVA_HOME = $JavaHome
    $env:ANDROID_HOME = $AndroidSdk
    $env:ANDROID_SDK_ROOT = $AndroidSdk
    $env:ANDROID_NDK_ROOT = $ndk
    $env:PATH = "$JavaHome/bin;$qtHost/bin;$env:PATH"
    $pythonPath = (Get-Command $Python).Source
    $ninjaPath = (Get-Command $Ninja).Source
    $argsCmake = @(
        '-S', $sourceDir, '-B', $buildDir, '-G', 'Ninja',
        "-DCMAKE_MAKE_PROGRAM=$ninjaPath",
        "-DCMAKE_TOOLCHAIN_FILE=$qtTarget/lib/cmake/Qt6/qt.toolchain.cmake",
        "-DCMAKE_PREFIX_PATH=$qtTarget", "-DQT_HOST_PATH=$qtHost",
        "-DANDROID_SDK_ROOT=$AndroidSdk", "-DANDROID_NDK=$ndk",
        '-DANDROID_ABI=arm64-v8a', '-DQT_ANDROID_ABIS=arm64-v8a',
        "-DANDROID_PLATFORM=android-$($config.android_min_sdk)",
        "-DCMAKE_BUILD_TYPE=$Configuration", "-DPython3_EXECUTABLE=$pythonPath",
        '-DQGC_APP_NAME=STRATUM', '-DQGC_ANDROID_PACKAGE_NAME=com.nexam.stratum',
        '-DQGC_BUILD_TESTING=OFF', '-DQGC_USE_CACHE=OFF',
        '-DQT_ANDROID_SIGN_APK=OFF'
    )
    if ($GStreamerRoot) {
        $argsCmake += @('-DQGC_ENABLE_GST_VIDEOSTREAMING=ON', '-DQGC_ENABLE_QT_VIDEOSTREAMING=OFF', "-DGStreamer_ROOT_DIR=$GStreamerRoot")
    } else {
        $argsCmake += @('-DQGC_ENABLE_GST_VIDEOSTREAMING=OFF', '-DQGC_ENABLE_QT_VIDEOSTREAMING=ON')
    }
    & cmake @argsCmake
    if ($LASTEXITCODE -ne 0) { throw 'Android CMake configuration failed.' }
    & cmake --build $buildDir --target apk --parallel $Jobs
    if ($LASTEXITCODE -ne 0) { throw 'Android APK build failed.' }
    $apks = @(Get-ChildItem $buildDir -Recurse -Filter '*.apk' -File)
    if (-not $apks.Count) { throw 'Build returned success but no APK was found.' }
    $apks | ForEach-Object { Write-Host "APK: $($_.FullName)" }
    if ($Configuration -eq 'Release') { Write-Host 'Release APKs require your own signing key before installation.' }
} finally {
    foreach ($name in $savedEnvironment.Keys) {
        [Environment]::SetEnvironmentVariable($name, $savedEnvironment[$name], 'Process')
    }
}
