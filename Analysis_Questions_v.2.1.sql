USE ManufacturingDowntimeDB;


SELECT DISTINCT Machine_ID, COUNT(*) AS NumOfDowntime
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Machine_ID
ORDER BY 2;

EXEC sp_rename 'Fact_Table$.Cutting(kN)', 'Cutting', 'COLUMN';
--average pressures during Machine_Failure
SELECT Downtime, AVG(Hydraulic_Pressure) AS AvgHPressure, AVG(Coolant_Pressure) AS AvgCPressure, AVG(Air_System_Pressure) AS AvgASPressure
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--average pressures during No_Machine_Failure
SELECT Downtime, AVG(Hydraulic_Pressure) AS AvgHPressure, AVG(Coolant_Pressure) AS AvgCPressure, AVG(Air_System_Pressure) AS AvgASPressure
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--average temperatures during No_Machine_Faliure
SELECT Downtime, AVG(Hydraulic_Oil_Temperature) AS AvgHOTemp, AVG(Coolant_Temperature) AS AvgCTemp, AVG(Spindle_Bearing_Temperature) AS AvgSBTemp
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--average temperatures during Machine_Faliure
SELECT Downtime, AVG(Hydraulic_Oil_Temperature) AS AvgHOTemp, AVG(Coolant_Temperature) AS AvgCTemp, AVG(Spindle_Bearing_Temperature) AS AvgSBTemp
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--average spindle vibration during machine failure:
SELECT Downtime, AVG(Spindle_Vibration) AS AvgSV
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--average spindle vibration during no machine failure:
SELECT Downtime, AVG(Spindle_Vibration) AS AvgSV
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--spindle speed during machine failure:
SELECT Downtime, AVG(Spindle_Speed) AS AvgSS
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--spindle speed during no machine failure:
SELECT Downtime, AVG(Spindle_Speed) AS AvgSS
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--Average voltage during no mf:
SELECT Downtime, AVG(Voltage) AS AvgVoltage
FROM Fact_Table$
WHERE Downtime = 'No_Machine_failure'
GROUP BY Downtime;

--Average voltage during mf:
SELECT Downtime, AVG(Voltage) AS AvgVoltage
FROM Fact_Table$
WHERE Downtime = 'Machine_failure'
GROUP BY Downtime;

--average torque during no mf:
SELECT Downtime, AVG(Torque) AS AvgTorque
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--average torque during machine failure:
SELECT Downtime, AVG(Torque) AS AvgTorque
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--aveage cutting during no machine failure:
SELECT Downtime, AVG(Cutting) AS AvgCutting
FROM Fact_Table$
WHERE Downtime = 'No_Machine_Failure'
GROUP BY Downtime;

--aveage cutting during machine failure:
SELECT Downtime, AVG(Cutting) AS AvgCutting
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Downtime;

--total downtime change across months:
SELECT DATENAME(MONTH, DATE) AS Month, COUNT(*) AS Downtime_Frequency
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY DATENAME(MONTH, DATE), MONTH(Date)
ORDER BY 2 DESC;

SELECT Machine_ID, COUNT(Downtime)
FROM Fact_Table$
WHERE Downtime = 'Machine_Failure'
GROUP BY Machine_ID;
