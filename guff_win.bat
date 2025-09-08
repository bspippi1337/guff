@echo on
rem Hent aktivt strømskjema
for /f "tokens=3" %%a in ('powercfg /getactivescheme') do set SCHEME=%%a

rem Angi energisparer terskel til 100%
powercfg.exe setdcvalueindex %SCHEME% SUB_ENERGYSAVER ESBATTTHRESHOLD 100

rem Sett alle tidsavbrudd til 'aldri'
powercfg.exe -x -monitor-timeout-ac 0
powercfg.exe -x -monitor-timeout-dc 0
powercfg.exe -x -disk-timeout-ac 0
powercfg.exe -x -disk-timeout-dc 0
powercfg.exe -x -standby-timeout-ac 0
powercfg.exe -x -standby-timeout-dc 0
powercfg.exe -x -hibernate-timeout-ac 0
powercfg.exe -x -hibernate-timeout-dc 0
pause
