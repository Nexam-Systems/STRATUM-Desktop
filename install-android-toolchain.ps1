[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Python,
    [string]$QtRoot = 'C:\Qt',
    [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$JavaHome = 'C:\Program Files\Java\jdk-17',
    [switch]$AcceptAndroidLicenses
)
$ErrorActionPreference = 'Stop'
$config = Get-Content "$PSScriptRoot/qgroundcontrol/.github/build-config.json" -Raw | ConvertFrom-Json
$toolsDir = Join-Path $PSScriptRoot 'build/android-tools'
$venv = Join-Path $toolsDir 'venv'
New-Item -ItemType Directory -Force -Path $toolsDir | Out-Null
if (-not (Test-Path "$JavaHome/bin/javac.exe")) { throw 'Install JDK 17 or supply -JavaHome.' }
if (-not (Test-Path "$venv/Scripts/python.exe")) {
    & $Python -m venv $venv
    if ($LASTEXITCODE -ne 0) { throw 'Could not create the Android build Python environment.' }
}
$buildPython = "$venv/Scripts/python.exe"
& $buildPython -m pip install aqtinstall ninja jinja2
if ($LASTEXITCODE -ne 0) { throw 'Build tool installation failed.' }

$qtArgs = @('-m', 'aqt', 'install-qt', 'windows', 'android', $config.qt_version,
    'android_arm64_v8a', '-O', $QtRoot, '-m') + ($config.qt_modules -split ' ')
& $buildPython @qtArgs
if ($LASTEXITCODE -ne 0) { throw 'Qt Android installation failed.' }

$sdkManager = "$AndroidSdk/cmdline-tools/latest/bin/sdkmanager.bat"
if (-not (Test-Path $sdkManager)) {
    $archive = Join-Path $toolsDir 'android-commandline-tools.zip'
    $extractDir = Join-Path $toolsDir 'commandline-tools'
    Invoke-WebRequest "https://dl.google.com/android/repository/commandlinetools-win-$($config.android_cmdline_tools)_latest.zip" -OutFile $archive
    Expand-Archive -LiteralPath $archive -DestinationPath $extractDir -Force
    New-Item -ItemType Directory -Force -Path "$AndroidSdk/cmdline-tools/latest" | Out-Null
    Copy-Item "$extractDir/cmdline-tools/*" "$AndroidSdk/cmdline-tools/latest" -Recurse -Force
}
$savedJava = $env:JAVA_HOME
try {
    $env:JAVA_HOME = $JavaHome
    if ($AcceptAndroidLicenses) {
        1..30 | ForEach-Object { 'y' } | & $sdkManager "--sdk_root=$AndroidSdk" --licenses
    } else {
        & $sdkManager "--sdk_root=$AndroidSdk" --licenses
    }
    if ($LASTEXITCODE -ne 0) { throw 'Android SDK license step failed.' }
    & $sdkManager "--sdk_root=$AndroidSdk" 'platform-tools' "platforms;android-$($config.android_platform)" "build-tools;$($config.android_build_tools)" "ndk;$($config.ndk_full_version)"
    if ($LASTEXITCODE -ne 0) { throw 'Android SDK installation failed.' }
} finally {
    $env:JAVA_HOME = $savedJava
}
& "$PSScriptRoot/build-android.ps1" -QtRoot $QtRoot -AndroidSdk $AndroidSdk -JavaHome $JavaHome -Python $buildPython -Ninja "$venv/Scripts/ninja.exe" -CheckOnly
