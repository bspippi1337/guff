@echo on
rem Hent aktivt strømskjema
for /f "tokens=3" %%a in ('powercfg /getactivescheme') do set SCHEME=%%a

rem Angi energisparer terskel til 100% (bruk GUID-er direkte for maksimal kompatibilitet)
rem Energy Saver subgroup: DE830923-A562-41AF-A086-E3A2C6BAD2DA
rem ESBATTTHRESHOLD setting: 9E6BDE4B-7BEE-4DAD-B14A-4E73C8859C77
powercfg.exe setdcvalueindex %SCHEME% DE830923-A562-41AF-A086-E3A2C6BAD2DA 9E6BDE4B-7BEE-4DAD-B14A-4E73C8859C77 100

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