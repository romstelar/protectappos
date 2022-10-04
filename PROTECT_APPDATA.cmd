@ECHO OFF
COLOR A
CLS
SET "TEXD=СОЗДАНИЕ"
IF NOT "%~1"=="" IF "%~1"=="r" SET "TEXD=УДАЛЕНИЕ"
ECHO ******************************************************************************
ECHO                  %TEXD% ИММУНИТЕТА ОТ МУСОРНЫХ ПРОГРАММ
ECHO ******************************************************************************
ECHO.
REM ======================================================

	IF NOT "%~1"=="" SET "ARG=%~1"
	IF NOT "%~1"=="" GOTO mSKIP_SELECT
		ECHO c - Создать файлы (по умолчанию)
		ECHO r - Удалить файлы
		ECHO.
		SET "ARG=c"
		SET /p "ARG=команда: "
		ECHO.
	:mSKIP_SELECT

	REM Создаваемые файлы:
	SET "NEWDIR=GWX"
	SET "NEWDIR=360 %NEWDIR%"
	SET "NEWDIR=DBG %NEWDIR%"
	SET "NEWDIR=CEF %NEWDIR%"
	SET "NEWDIR=Grym %NEWDIR%"
	SET "NEWDIR=ESET %NEWDIR%"
	SET "NEWDIR=DRPSu %NEWDIR%"
	SET "NEWDIR=Amigo %NEWDIR%"
	SET "NEWDIR=Avast %NEWDIR%"
	SET "NEWDIR=Iobit %NEWDIR%"
	SET "NEWDIR=Unity %NEWDIR%"
	SET "NEWDIR=Skyrim %NEWDIR%"
	SET "NEWDIR=cloud %NEWDIR%"
	SET "NEWDIR=Disk-O %NEWDIR%"
	SET "NEWDIR=Chrone %NEWDIR%"
	SET "NEWDIR=Yandex %NEWDIR%"
	SET "NEWDIR=MailRu %NEWDIR%"
	SET "NEWDIR=Mail.Ru %NEWDIR%"
	SET "NEWDIR=discord %NEWDIR%"
	SET "NEWDIR=SKIDROW %NEWDIR%"
	SET "NEWDIR=Sputnik %NEWDIR%"
	SET "NEWDIR=Ubisoft %NEWDIR%"
	SET "NEWDIR=YCanPDF %NEWDIR%"
	SET "NEWDIR=360safe %NEWDIR%"
	SET "NEWDIR=GHISLER %NEWDIR%"
	SET "NEWDIR=CrashRpt %NEWDIR%"
	SET "NEWDIR=SkyDrive %NEWDIR%"
	SET "NEWDIR=Nichrome %NEWDIR%"
	SET "NEWDIR=InfoTeCS %NEWDIR%"
	SET "NEWDIR=AbiSuite %NEWDIR%"
	SET "NEWDIR=MediaGet2 %NEWDIR%"
	SET "NEWDIR=FatalSoft %NEWDIR%"
	SET "NEWDIR=SaveSense %NEWDIR%"
	SET "NEWDIR=360Quarant %NEWDIR%"
	SET "NEWDIR=ts-modmail %NEWDIR%"
	SET "NEWDIR=SwReporter %NEWDIR%"
	SET "NEWDIR=PunkBuster %NEWDIR%"
	SET "NEWDIR=ZaxarGames %NEWDIR%"
	SET "NEWDIR=tt-cleaner %NEWDIR%"
	SET "NEWDIR=PushControl %NEWDIR%"
	SET "NEWDIR=SearcherBar %NEWDIR%"
	SET "NEWDIR=InstallPack %NEWDIR%"
	SET "NEWDIR=DriverPack %NEWDIR%"
	SET "NEWDIR=SquirrelTemp %NEWDIR%"
	SET "NEWDIR=EmieUserList %NEWDIR%"
	SET "NEWDIR=EmieSiteList %NEWDIR%"
	SET "NEWDIR=SystemEvents %NEWDIR%"
	SET "NEWDIR=RMS_settings %NEWDIR%"
	SET "NEWDIR=PeerDistRepub %NEWDIR%"
	SET "NEWDIR=SaveSenseLive %NEWDIR%"
	SET "NEWDIR=ShortcutLinks %NEWDIR%"
	SET "NEWDIR=ZetaGamesNews %NEWDIR%"
	SET "NEWDIR=ControlCenter4 %NEWDIR%"
	SET "NEWDIR=zaxargamesteam %NEWDIR%"
	SET "NEWDIR=.zaxargamesteam %NEWDIR%"
	SET "NEWDIR=ZetaGamesViewer %NEWDIR%"
	SET "NEWDIR=ZaxarGameBrowser %NEWDIR%"
	SET "NEWDIR=360TotalSecurity %NEWDIR%"
	SET "NEWDIR=.ZaxarGameBrowser %NEWDIR%"
	SET "NEWDIR=EmieBrowserModeList %NEWDIR%"
	SET "NEWDIR=AutotuningWorkplace %NEWDIR%"
	
	REM Вызов функции блокировки:
	CALL :CREATE_BLOCK_FILE "%APPDATA%" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%APPDATA%\..\Local" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%APPDATA%\..\LocalLow" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%SYSTEMDRIVE%\ProgramData" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%SYSTEMDRIVE%\Program Files" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%SYSTEMDRIVE%\Program Files (x86)" "%NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%APPDATA%" "Temp"
	CALL :CREATE_BLOCK_FILE "%APPDATA%\..\LocalLow" "Temp"
	CALL :CREATE_BLOCK_FILE "%USERPROFILE%" "%NEWDIR%"
	
	REM Блокировки для корня диска:
	SET "NEWDIR=Firefox %NEWDIR%"
	CALL :CREATE_BLOCK_FILE "%SYSTEMDRIVE%" "%NEWDIR%"
	
	REM Блокировки для гугл:
	IF EXIST "C:\Windows\PLA\PData\Pack" CALL :CREATE_BLOCK_FILE "C:\Windows\PLA\PData\Pack\01_Internet\1.Browsers\Pr0f1i1es\X4a6m1n.chrpf" "SwReporter" "ex_space"
	CALL :CREATE_BLOCK_FILE "%APPDATA%\..\Local\Google" "SwReporter" "ex_space"
	CALL :CREATE_BLOCK_FILE "%APPDATA%\..\Local\Google\Chrome\User Data" "SwReporter" "ex_space"
	CALL :CREATE_FILE "%APPDATA%\..\Local\Google\Software Reporter Tool"
	CALL :CREATE_FILE "%APPDATA%\..\Local\Google\Chrome Cleanup Tool"
	CALL :CREATE_FILE "%TMP%\SwReporter"
	CALL :CREATE_FILE "%TMP%\Software Reporter Tool"
	CALL :CREATE_FILE "%TMP%\Chrome Cleanup Tool"
	IF "%~1"=="" PAUSE
	
REM =============================================================================
REM ФУНКЦИИ
REM =============================================================================
GOTO mFUNC_SKIP
	
	
	REM Функция заполнения каталогов блокировочными файлами:
	:CREATE_BLOCK_FILE
		IF NOT EXIST "%~1" EXIT /B
		FOR %%A IN (%~2) DO (
			CALL :CREATE_FILE "%~1\%%A"
		)
		REM Добавление файлов с пробелами:
		IF "%~3"=="" (
			CALL :CREATE_FILE "%~1\My Games"
			CALL :CREATE_FILE "%~1\Zaxar Games"
			CALL :CREATE_FILE "%~1\IQIYI Video"
			CALL :CREATE_FILE "%~1\XRay Engine"
			CALL :CREATE_FILE "%~1\Rockstar Games"
			CALL :CREATE_FILE "%~1\Avast Software"
			CALL :CREATE_FILE "%~1\Shadow Defender"
			CALL :CREATE_FILE "%~1\Tracker Software"
			CALL :CREATE_FILE "%~1\DriverPack Cloud"
			CALL :CREATE_FILE "%~1\ChemTable Software"
			CALL :CREATE_FILE "%~1\Reigistration Agent"
			CALL :CREATE_FILE "%~1\Chrome Cleanup Tool"
			CALL :CREATE_FILE "%~1\Adguard Software Ltd"
			CALL :CREATE_FILE "%~1\Media Center Programs"
			CALL :CREATE_FILE "%~1\Software Reporter Tool"
			CALL :CREATE_FILE "%~1\Sony Creative Software Inc"
			CALL :CREATE_FILE "%~1\ICE Book Reader Professional Russian"
		)
		ECHO.
	EXIT /B
	
	REM Создание файла и запрет его удаления:
	:CREATE_FILE
		IF "%ARG%"=="r" ICACLS "%~1" /reset "%USERNAME%"   /Q 1>nul 2>&1
		IF "%ARG%"=="r" ICACLS "%~1" /grant "%USERNAME%:F" /Q 1>nul 2>&1
		CALL :mREMOVEDIR  "%~1"
		CALL :mREMOVEFILE "%~1"
		IF "%ARG%"=="c" (
			ECHO 1111>"%~1"
			IF EXIST "%~1" ATTRIB +S +H +R +A "%~1" 1>nul 2>&1
			ICACLS "%~1" /deny "%USERNAME%:D" /Q 1>nul 2>&1
		)
		ECHO "%~1"
	EXIT /B
	
	REM Удаление директории:
	:mREMOVEDIR
		ATTRIB -S -H -R -A "%~1" 1>nul 2>&1
		IF NOT EXIST "%~1" EXIT /B
		SET "D=%CD%"
		CD /D "%~1" 1>nul 2>&1||EXIT /B
		CD /D "%D%"
		SET /A C=0
		:mREMOVEDIR0
		DEL /F /S /Q /A H R S A	"%~1\*" 1>nul 2>&1 && RD /S /Q "%~1" 1>nul 2>&1
		SET /A C=%C%+1
		IF %C% EQU 200 EXIT /B
		IF EXIST "%~1" GOTO mREMOVEDIR0
		IF "%2"=="m" MD "%~1"
	EXIT /B
	
	REM Удаление файла:
	:mREMOVEFILE
		ATTRIB -S -H -R -A "%~1" 1>nul 2>&1
		IF NOT EXIST "%~1" EXIT /B
		SET /A C=0
		:mREMOVEFILE0
		DEL /F /Q /A H R S A "%~1" 1>nul 2>&1
		SET /A C=%C%+1
		IF %C% EQU 200 EXIT /B
		IF EXIST "%~1" GOTO mREMOVEFILE0
	EXIT /B
	
:mFUNC_SKIP