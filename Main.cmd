@echo off

:: This script will run alarm sound every 20 minutes by default. Users can give their custom timings as well.

:: Check if alarm tune exists
set AlarmPath=%cd%/Alarm.mp3
if NOT EXIST %AlarmPath% (
	set AlarmPath=C:\Windows\media\Alarm01.wav
	)
:: Section User Input: Find the default choice by user

set /a "SleepTime=20*60"
set /p IsDefault=Proceed with default 20 minutes Interaval(y/n)?
if /I "%IsDefault%"=="Y" GOTO Execute
if /I "%IsDefault%"=="YES" GOTO Execute
GOTO GetTime

:: If user gave no as answer get the time from user and set the sleep time
:GetTime
set /p SleepTime=Enter the time in minutes :
set /a SleepTime=SleepTime+0
if NOT %SleepTime%==0 (
	set /a SleepTime=SleepTime*60
	)else (
	echo Non Numeric characters found. Please enter a valid number 
	GOTO GetTime
	)
set /a SleepTime=SleepTime+20
echo Added 20 seconds to maintain the cycle
GOTO Execute

:: This script will continue to execute unless user closes the terminal
:Execute
TIMEOUT /T %SleepTime%
Start C:\Users\Sridharan\Downloads\Alarm.mp3
GOTO Execute
