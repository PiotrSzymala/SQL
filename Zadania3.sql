------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta wraz z jego pełnym adresem
---------- (ulica, miasto, kod pocztowy). Wyniki posortuj względem miasta.
------------------------------------------------------------------------------------------
---------- CONCAT()
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------

SELECT ContactName, CONCAT( ' ', Address, ' ', City, ' ', PostalCode)
FROM Customers
ORDER BY City 


------------------------------------------------------------------------------------------
---------- Wyświetl dane pracownika, imię małymi literami, nazwisko dużymi.
------------------------------------------------------------------------------------------
---------- LOWER(), UPPER()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT LOWER(FirstName), UPPER(LastName) 
FROM Employees

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu oraz pozycję spacji w nazwie produktu.
------------------------------------------------------------------------------------------
---------- CHARINDEX()
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT ProductName, CHARINDEX(' ', ProductName) as 'Pozycja_spacji_w_nazwie'
FROM Products


------------------------------------------------------------------------------------------
---------- Wyświetl pierwszą część nazwy produktu (do spacji).
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT ProductName, SUBSTRING (ProductName, 1, CHARINDEX(' ', ProductName)) as 'Pierwsza_czesc_do_spacji'
FROM Products



------------------------------------------------------------------------------------------
---------- Wyświetl bieżącą datę systemową oraz jej poszczególne składowe.
------------------------------------------------------------------------------------------
---------- GETDATE()
---------- DATEPART()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------

SELECT GETDATE()

---------- Lub

SELECT DATEPART(YY, GETDATE()) as 'Rok',
 DATEPART(MM, GETDATE()) as 'Miesiąc',	
 DATEPART(DD, GETDATE()) as 'Dzień',
 DATEPART(HH, GETDATE()) as 'Godzina',
 DATEPART(MI, GETDATE()) as 'Minuta',
 DATEPART(SS, GETDATE()) as 'Sekunda'
------------------------------------------------------------------------------------------
---------- Wyświetl zamówienia złożone w czerwcu 1997 roku.
---------- Wyniki pokaż w kolejności zamówień.
------------------------------------------------------------------------------------------
---------- 30 rows
------------------------------------------------------------------------------------------

SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 6
ORDER BY (OrderDate)

------------------------------------------------------------------------------------------
---------- Wyświetl zamówienia złożone w 1997 roku od stycznia do czerwca.
---------- Wyniki posortuj względem daty zamówienia.
------------------------------------------------------------------------------------------
---------- 185 rows
------------------------------------------------------------------------------------------

SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1997 and MONTH(OrderDate) between 1 and 6
ORDER BY (OrderDate)


------------------------------------------------------------------------------------------
---------- Wyświetl imię i nazwisko pracownika oraz czas jego pracy (w latach).
------------------------------------------------------------------------------------------
---------- DATEDIFF()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT FirstName, LastName, DATEDIFF(year, HireDate, GETDATE()) as 'Czas_pracy_w_latach' 
FROM Employees



------------------------------------------------------------------------------------------
---------- Wyświetl wszystkie zamówienia niezrealizowane w terminie
---------- wraz z informacją o ich opóźnieniu.
---------- Wyniki posortuj malejąco względem opóźnienia.
------------------------------------------------------------------------------------------
---------- CAST()
------------------------------------------------------------------------------------------
---------- 37 rows
------------------------------------------------------------------------------------------

SELECT *, DATEDIFF(DAY, CAST(RequiredDate as datetime) , CAST(ShippedDate as datetime)) as 'Spoznione_w_dniach'
FROM Orders
WHERE DATEDIFF(DAY, RequiredDate , ShippedDate) > 0 
ORDER BY 'Spoznione_w_dniach' desc

------------------------------------------------------------------------------------------
---------- Wyświetl najdroższe 10 produktów w kolejności malejącej po cenie.
------------------------------------------------------------------------------------------
---------- TOP
------------------------------------------------------------------------------------------
---------- 10 rows
------------------------------------------------------------------------------------------

SELECT TOP(10) * 
FROM Products
ORDER BY (UnitPrice) DESC


------------------------------------------------------------------------------------------
---------- Wyświetl 1% najtańszych ZAMÓWIONYCH produktów 
---------- wraz z informacją o cenie, zniżce i ich liczbie.
------------------------------------------------------------------------------------------
---------- PERCENT
------------------------------------------------------------------------------------------
---------- 22 rows
------------------------------------------------------------------------------------------

SELECT TOP 1 PERCENT *
FROM [Order Details]
ORDER BY UnitPrice


------------------------------------------------------------------------------------------
---------- Wyświetl w kolejności odwrotnej do alfabetycznej
---------- miasta do których były realizowane zamówienia.
---------- Wyniki posortuj względem miasta dostarczenia,
------------------------------------------------------------------------------------------
---------- DISTINCT()
------------------------------------------------------------------------------------------
---------- 70 rows
------------------------------------------------------------------------------------------
SELECT DISTINCT ShipCity
FROM Orders
ORDER BY ShipCity DESC