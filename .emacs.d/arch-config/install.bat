@echo off
REG ADD "HKCR\*\shell\open with emacs...\command" /ve /d "e:\Emacs\bin\emacsclientw.exe \"%%1\" -a e:\Emacs\bin\runemacs.exe"
