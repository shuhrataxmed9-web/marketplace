# AI Travel Assistant — APK yig'ish skripti
$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot

$NodeDir = Join-Path $Root "tools\node-v24.15.0-win-x64"
$JdkDir = Join-Path $Root "tools\jdk-17"
$SdkRoot = Join-Path $Root "tools\android-sdk"
$CmdlineDir = Join-Path $SdkRoot "cmdline-tools\latest"

if (Test-Path (Join-Path $NodeDir "node.exe")) {
    $env:PATH = "$NodeDir;$env:PATH"
}

if (Test-Path (Join-Path $JdkDir "bin\java.exe")) {
    $env:JAVA_HOME = $JdkDir
    $env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
}

if (Test-Path $SdkRoot) {
    $env:ANDROID_HOME = $SdkRoot
    $env:ANDROID_SDK_ROOT = $SdkRoot
}

Set-Location $Root

if (-not (Test-Path (Join-Path $JdkDir "bin\java.exe")) -or -not (Test-Path (Join-Path $CmdlineDir "bin\sdkmanager.bat"))) {
    Write-Host "=== 0. Build vositalari (JDK + Android SDK) ===" -ForegroundColor Cyan
    & (Join-Path $Root "scripts\setup-build-tools.ps1")
    $env:JAVA_HOME = $JdkDir
    $env:ANDROID_HOME = $SdkRoot
    $env:PATH = "$env:JAVA_HOME\bin;$CmdlineDir\bin;$env:PATH"
}

Write-Host "=== 1. Bog'liqliklar ===" -ForegroundColor Cyan
npm install --legacy-peer-deps

Write-Host "`n=== 2. Android (expo prebuild) ===" -ForegroundColor Cyan
npx expo prebuild --platform android --non-interactive

if ($env:ANDROID_HOME) {
    $lp = Join-Path $Root "android\local.properties"
    "sdk.dir=$($env:ANDROID_HOME -replace '\\','/')" | Set-Content -Path $lp -Encoding ASCII
}

Write-Host "`n=== 3. APK yig'ilmoqda (Gradle) ===" -ForegroundColor Cyan
Push-Location (Join-Path $Root "android")
.\gradlew.bat assembleDebug --no-daemon
Pop-Location

$apk = Join-Path $Root "android\app\build\outputs\apk\debug\app-debug.apk"
if (Test-Path $apk) {
    $out = Join-Path $Root "AITravelAssistant-debug.apk"
    Copy-Item $apk $out -Force
    $sizeMb = [math]::Round((Get-Item $out).Length / 1MB, 1)
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "TAYYOR APK: $out ($sizeMb MB)" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} else {
    Write-Host "APK topilmadi. Gradle xatosini yuqorida tekshiring." -ForegroundColor Red
    exit 1
}
