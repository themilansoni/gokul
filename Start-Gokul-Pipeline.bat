@echo off
setlocal enabledelayedexpansion

title Gokul Pipeline CRM Server

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║        🔷 GOKUL PIPELINE - ADVANCED CRM PLATFORM 🔷         ║
echo ║                                                               ║
echo ║                   Starting Server...                          ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Get the IP address
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "IPv4 Address"') do (
    set IP=%%A
    goto found_ip
)

:found_ip
set IP=%IP: =%

if "%IP%"=="" (
    set IP=172.31.98.50
    echo ⚠️  Could not auto-detect IP. Using default: %IP%
) else (
    echo ✅ Detected IP Address: %IP%
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo 🌐 ACCESS URLS:
echo ═══════════════════════════════════════════════════════════════
echo.
echo   📱 Local Access:
echo      http://localhost:8000/lead-management-system.html
echo.
echo   🖥️  Network Access (from other devices):
echo      http://%IP%:8000/lead-management-system.html
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🔐 Login Credentials:
echo    Email:    test@test.com
echo    Password: pass@123
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo ⏳ Server starting on port 8000...
echo.
echo 💡 Tips:
echo    • Press Ctrl+C to stop the server
echo    • Keep this window open while using the CRM
echo    • Refresh browser if connection drops
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

REM Start the Python HTTP server
cd /d "%~dp0"
python -m http.server --bind 0.0.0.0 8000

pause
