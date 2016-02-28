@echo off
echo.
echo.
echo "------ Switching to matrix like screen ------"
color 02

echo "------ Repairing server incase the last shutdown was abrupt ------"
echo.
echo.
mongod --storageEngine=mmapv1 -f "mongod.conf" --repair

echo.
echo.
echo "------ Starting mongodb server ------"
echo.
echo.
START /B mongod --storageEngine=mmapv1 -f "mongod.conf"    
:: 32 bit OS does not support wiredtiger engine.
:: Use this command for using default wiredTiger engine  -->  START /B mongod  -f "mongod.conf" 

echo.
echo.
echo "Waiting 5 secs for server to start"
timeout 5
echo.
echo.

echo "------ Echo mongo server PID ------"
echo.
echo.
TASKLIST | findstr -i mongo

echo.
echo.
echo "Starting mongo shell..."
echo.
echo.

echo "------ Close this window to shutdown mongodb server ------"
echo.
echo.

cmd /K mongo
