@ECHO OFF
COLOR A
CLS
ECHO ******************************************************************************
ECHO                       СОЗДАНИЕ ИММУНИТЕТА ДЛЯ ФЛЕШКИ
ECHO ******************************************************************************
ECHO.
REM ======================================================

	ECHO c - Создать файлы
	ECHO r - Удалить файлы
	ECHO.
	:QV_ARG
	SET /p "ARG=команда: "
	IF NOT "%ARG%"=="c" IF NOT "%ARG%"=="r" GOTO QV_ARG
	ECHO.

	REM Создаваемые папки:
	SET "NEWDIR="
	SET "NEWDIR=$RECYCLE.BIN %NEWDIR%"
	SET "NEWDIR=RECYCLER %NEWDIR%"
	SET "NEWDIR=RECYCLED %NEWDIR%"
	SET "NEWDIR=autorun.inf %NEWDIR%"
	SET "NEWDIR=autorun.ini %NEWDIR%"
	
	REM Вызов функции заполнения:
	CALL :CREATE_BLOCK_FILE "%~d0" "%NEWDIR%"
	CALL :CREATE_FILE "%~d0\System Volume Information"
	PAUSE
	
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
		ECHO.
	EXIT /B
	
	REM Создание файла и запрет его удаления:
	:CREATE_FILE
		IF "%ARG%"=="r" ICACLS "%~1" /reset "%USERNAME%"   /Q 1>nul 2>&1
		IF "%ARG%"=="r" ICACLS "%~1" /grant "%USERNAME%:F" /Q 1>nul 2>&1
		CALL :mREMOVEDIR  "%~1"
		CALL :mREMOVEFILE "%~1"
		IF "%ARG%"=="c" (
			ECHO 1111111111>"%~1"
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