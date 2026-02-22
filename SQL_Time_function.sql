
--time function (extraction)

SELECT
O.OrderID,
O.CreationTime,
YEAR(O.CreationTime) AS YEAR,
MONTH(O.CreationTime) AS Month,
DAY(O.CreationTime) AS Day
FROM Sales.Orders AS O;

--here we use year ,month,day function for extraction creationTime value.

--now we use datepart() function for extraction creationTime value.
--datepart() returns a speacific part of a date as a number.
--syntax ---datepart(part,date).part may week or quarter.

SELECT 
O.OrderID,
DATEPART(WEEK,O.CreationTime) AS WEEK_DP,
DATEPART(QUARTER,O.CreationTime) AS QUARTER_DP,
DATEPART(HOUR,O.CreationTime) AS HOUR_DP,
DATEPART(MINUTE,O.CreationTime) AS MINUTE_DP,
DATEPART(SECOND,O.CreationTime) AS SECOND_DP,
DATEPART(MILLISECOND,O.CreationTime) AS MILLISECOND_DP,
DATEPART(WEEKDAY,O.CreationTime) AS WEEKDAY_DP
FROM Sales.Orders AS O;

/*HERE we can findout weekday,millisecond,second,minute,hour,quarter,week.
all the result showed in int */


/* Here we discuss another function call DATENAME() IT RETURNS THE NAME OF
A SPECIFIC PART OF A DATE. IT mainly return STRING   */

SELECT 
O.OrderID,
O.CreationTime,
DATENAME(MONTH,O.CreationTime) AS MONTH_NAME,
DATENAME(WEEKDAY,O.CreationTime) AS WEEKDAY_NAME,
DATENAME(DAY,O.CreationTime) AS DAY_AS_STRING,
DATENAME(YEAR,O.CreationTime) AS YEAR_AS_SRING
FROM Sales.Orders AS O;

--DATENAME() FUNCTION ALLWAYS STORE DATA IN STRING AN OTHER TABLE. 


                  -- DATETRUNC() --
/* DATETRUNC() RETURNS Truncates the date to the sepcific part.
sntax -- DATEPART(PART,DATETIME)*/

SELECT 
O.OrderID,
O.CreationTime,
DATETRUNC(YEAR,O.CreationTime) YEAR_DT,
DATETRUNC(MONTH,O.CreationTime) MONTH_DT,
DATETRUNC(DAY,O.CreationTime) DAY_DT,
DATETRUNC(HOUR,O.CreationTime) HOUR_DT,
DATETRUNC(MINUTE,O.CreationTime) MINUIT_DT
FROM Sales.Orders AS O;

--FOR YEAR result 2025-01-01 ,Month result 2025-09-01,Day result 2025-03-07 00:00:00.0000000 
-- IT is most need for data analysis.


SELECT 
--DATETRUNC(MONTH,O.CreationTime) CREATION,
DATETRUNC(YEAR,O.CreationTime) CREATION_YEAR,
COUNT(*)
FROM Sales.Orders AS O
GROUP BY DATETRUNC(YEAR,O.CreationTime);


                  -- EOMONTH() --

--EOMONTH() FUNCTION RETURNS THE END OF THE MONTH ONLY.

SELECT 
O.OrderID,
CreationTime,
EOMONTH(CreationTime) END_OF_MONTH,
--How to show start of the month.that we can do by datetrunc(month,yourdata)
DATETRUNC(month,CreationTime) start_of_month,
/* remember that datetrunc(month , data) return Y-M-D H:M:S also so if we 
remove hours,minites,seconds then use CAST() function.*/
CAST(DATETRUNC(month,CreationTime) AS DATE) Start_of_month
FROM Sales.Orders AS O;

--The start of month and End of month are needed generated report.

--Q/A HOWE MANY ORDERS WARE PLACED EACH YEAR?

SELECT 
YEAR(OrderDate),
COUNT(*) NrOfOrder
FROM Sales.Orders
GROUP BY YEAR(OrderDate);

--WHERE WE USE COUNT () FUNCTION THEN USE GROUP BY MUST.

--Q/A HOWE MANY ORDERS WARE PLACED EACH MONTH?

SELECT 
--MONTH(OrderDate) month_number,
DATENAME(month,OrderDate) month_name,
COUNT(*) NrOfOrder
FROM Sales.Orders
--remember allways after group by use same funtion before you used.if not terminal show error.
GROUP BY DATENAME(month,OrderDate);


--part Extraction Use Case --- (Data Filtering)

--show all orders that were placed during the monh of february.

SELECT 
*
--O.OrderID,
--MONTH(O.OrderDate)
FROM Sales.Orders AS O
/* Best Practice
Filtering Data using an integer is faster than using a string.
Avoid Using DATENAME for Filtering data,instead use DATAPART */
WHERE MONTH(O.OrderDate) = 2;


                    -- DATA TYPES --

-- DAY ,MONTH ,YEAR ,DATAPART   ARE   INT
--                   DATANAME   --->  STRING
--                   DATETRUNC  --->  DATATIME
--                   EOMONTH    --->  DATE






