@echo off

SET path_sql_script=%~dp0
SET SERVER=127.0.0.1
SET DB=RestauLand
SET port=5432
SET LOGIN=postgres
SET PASSWORD=postgres

SET SQLCMD="C:\laragon\bin\postgresql\postgresql-11.0.1\bin\psql"

:: %SQLCMD% -c "select * from listes_boissons" "dbname=%DB% user=%LOGIN% password=%PASSWORD% host=%SERVER%"
cd %path_sql_script%
:: FORFILES /S /M *.sql /C "cmd /c echo @file"
for /f "tokens=*" %%s in ('dir /b *.sql ^| sort') do (
	echo -------------- %%s ----------
	%SQLCMD% --file=%%s  "dbname=%DB% user=%LOGIN% password=%PASSWORD% host=%SERVER%"
	echo -----------------------------
)