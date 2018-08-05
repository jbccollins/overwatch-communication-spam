#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Filearray := []
Loop, Files, *.txt
   Filearray.push(A_LoopFileLongPath)
total := Filearray.MaxIndex()
^4::
   Random, fileNumber, 1, total
   fileName := Filearray[fileNumber]
   Loop, Read, %fileName%
   {
      total_lines = %A_Index%
   }
   Random, randomLineNumber, 1, total_lines
   FileReadLine, lineText, %fileName%, randomLineNumber
   clipboard = %lineText%
   ClipWait
   Send, {Enter}
   Sleep, 45
   Send, ^v
   Send, {Enter}
Return

Shift::
   Send, v
Return

$`;::
   Send, `;
   Click, WheelUp
Return

$'::
   Send, '
   Click, WheelDown
Return

~::ExitApp