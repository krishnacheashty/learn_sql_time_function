use SalesDB
select * from Sales.Orders

                --date format--

SELECT 
O.OrderID,
O.CreationTime,
FORMAT(O.CreationTime,'dd') dd,
FORMAT(O.CreationTime,'ddd') ddd,
FORMAT(O.CreationTime,'dddd') dddd,
FORMAT(O.CreationTime,'MM') MM,
FORMAT(O.CreationTime,'MMM') MMM,
FORMAT(O.CreationTime,'MMMM') MMMM,
FORMAT(O.CreationTime,'yy') YYYY,
FORMAT(O.CreationTime,'MM-dd-yyyy') dd,
FORMAT(O.CreationTime,'dd-MM-yyyy HH:mm:ss') ddms
FROM Sales.Orders AS O

--show creation time using the following format:
-- Day Sun Feb Q1 2036 23:45:68 PM

SELECT 
O.CreationTime,
'Day ' + FORMAT(o.CreationTime,'ddd MMM')+
' Q'+DATENAME(quarter,CreationTime) + FORMAT(O.CreationTime,' yyyy HH:mm:ss tt')
FROM Sales.Orders AS O

-- tt for am/pm 
-- datename(quarter,dataVAL) FOR find quarter of year 1,2,3 or 4.

                    -- Convert() --
SELECT
O.CreationTime,
CONVERT(DATE,O.CreationTime,32) [CONVER TO VARCHAR TO DATE],
CONVERT(VARCHAR,O.CreationTime,112) [CONVER TO DATE TO VARCHAR]
FROM Sales.Orders AS O

                --   CAST()   ----
SELECT 
CAST('123' AS INT) AS [STRING TO INT],
CAST(123 AS VARCHAR) AS [INT TO STRING],
CAST('2034-05-03' AS DATE) AS [String to Date],
CAST('2034-05-03' AS DATEtime2) AS [String to Datetime],
o.CreationTime,
CAST(O.CreationTime AS DATE) AS [Datetime to Date]
from Sales.Orders as o

--CAST() Function Only Change the data type one to another. by AS


--  DATEADD() :
--Adds or Subtracts a specigic time interval to/from a date.

select 
o.OrderID,
o.OrderDate,
DATEADD(year,3,o.OrderDate) as Three_Year_Add,
DATEADD(month,2,o.OrderDate) as Three_month_Add,
DATEADD(day,-10,o.OrderDate) as TenDaysBefore
from Sales.Orders as o

--      DATEDIFF() 
-- FIND THE different between two dates.

-- datediff(part,start_date,end_date) 

--CALCULATE THE AGE OF EMPLOYESS

SELECT
E.EmployeeID,
E.BirthDate,
DATEDIFF(YEAR,BirthDate,GETDATE()) AS [AGE OF EMPLOYEES] 
FROM Sales.Employees AS E

--FIND THE AVERAGE SHIPPING DURATION IN DAYS FOR EACH MONTH

SELECT 
--O.OrderID,
--O.OrderDate,
--O.ShipDate,
MONTH(O.OrderDate) AS ORDER_DATE,
AVG(DATEDIFF(DAY,O.OrderDate,O.ShipDate)) AS [AVG DAY NEED TO SHIPPING]
FROM Sales.Orders AS O 
GROUP BY MONTH(O.OrderDate) 



-- Time Gap Analysis
-- Find the number of days between each order and the previous order.
SELECT 
O.OrderID,
O.OrderDate AS CurrentOrderDate,
--O.ShipDate,
LAG(O.OrderDate) OVER (ORDER BY ORDERDATE) PreviousOrderDate,
DATEDIFF(DAY,LAG(O.OrderDate) OVER (ORDER BY ORDERDATE),O.OrderDate) NrOfDays
FROM Sales.Orders AS O 

--LAG() FUNCTION THAT  help to find previous number of list
--that case frist item allways be NULL cause previous it empty.

--date validatiion

select 
CAST (o.OrderDate AS date) orderdate,
ISDATE(O.CreationTime) DATECHECK
from Sales.Orders AS O;





  