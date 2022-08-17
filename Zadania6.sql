------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz liczbę jego zamówień.
------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------

SELECT ContactName , COUNT(OrderDate) as 'liczba_zamowien'
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID =Orders.CustomerID
GROUP BY ContactName

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z roku 1996.
------------------------------------------------------------------------------------------
---------- 67 rows
------------------------------------------------------------------------------------------

SELECT ContactName , COUNT(Freight) as 'Suma_oplat_frachtowych'
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID =Orders.CustomerID
WHERE YEAR(OrderDate)= 1996
GROUP BY ContactName

------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów z poszczególnych krajów jeżeli jest ich co najmniej 5.
------------------------------------------------------------------------------------------
---------- HAVING
------------------------------------------------------------------------------------------
---------- 7 rows
------------------------------------------------------------------------------------------

SELECT COUNT(ContactName), Country as 'Liczba_klientow'
FROM Customers
GROUP BY Country
HAVING COUNT(Country)>4

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z kwietnia.
------------------------------------------------------------------------------------------
---------- 59 rows
------------------------------------------------------------------------------------------

SELECT ContactName, COUNT(Freight) as 'Suma_oplat_frachtowych'
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID =Orders.CustomerID
WHERE MONTH(OrderDate)= 4
GROUP BY ContactName

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz średnią opłatę frachtową dla zamówień  
---------- składanych w poszczególnych miesiącach.
------------------------------------------------------------------------------------------
---------- 526 rows
------------------------------------------------------------------------------------------

SELECT ContactName, MONTH(OrderDate) as 'Miesiac' ,AVG(Freight) as 'Średnia_opłata_frachtowa'
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID =Orders.CustomerID
GROUP BY ContactName, MONTH(OrderDate)
ORDER BY MONTH(OrderDate)

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta, produktu oraz liczbę sprzedanych produktów.
------------------------------------------------------------------------------------------
---------- 1685 rows
------------------------------------------------------------------------------------------

SELECT ContactName, Products.ProductName, SUM([Order Details].Quantity) as 'Liczba_Sprzedanych_Produktow'
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details]
ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products
ON Products.ProductID = [Order Details].ProductID
GROUP BY ContactName, Products.ProductName

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę dostawcy, kraj oraz maksymalną cenę jednostkową produktów
---------- uwzględniając tylko "USA" i "Canada".
------------------------------------------------------------------------------------------
---------- 6 rows
------------------------------------------------------------------------------------------

SELECT Suppliers.ContactName, Suppliers.Country, Max(Products.UnitPrice) as 'Maksymalna_cena_jednostkowa'
FROM Suppliers
INNER JOIN Products
ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.ContactName, Suppliers.Country
HAVING Suppliers.Country = 'USA' or Suppliers.Country = 'Canada'

------------------------------------------------------------------------------------------
----------  Wyświetl wartość zamówień w poszególnych miesiącach.
----------  Podziel zamówienia na duże ( > 100000 $) i małe.
------------------------------------------------------------------------------------------
---------- CASE WHEN ... THEN ... ELSE ... END
------------------------------------------------------------------------------------------
---------- 12 rows
------------------------------------------------------------------------------------------

SELECT MONTH(Orders.OrderDate) as 'Miesiac', SUM(UnitPrice * Quantity) as 'Wartosc_zamowienia' ,
CASE
    WHEN SUM(UnitPrice * Quantity) > 100000 THEN 'Zamowienie duze'
    ELSE 'Zamowienie male'
END AS WielkoscZamowienia
FROM [Order Details]
INNER JOIN Orders 
ON [Order Details].OrderID = Orders.OrderID 
GROUP BY  MONTH(Orders.OrderDate)
ORDER BY MONTH(Orders.OrderDate)

------------------------------------------------------------------------------------------
----------  Wyświetl wartość zamówień w poszególnych miesiącach.
----------  Podziel zamówienia na małe ( < 100000 $) i duże.
------------------------------------------------------------------------------------------
---------- IIF
------------------------------------------------------------------------------------------
---------- 12 rows
------------------------------------------------------------------------------------------

SELECT MONTH(Orders.OrderDate) as 'Miesiac', SUM(UnitPrice * Quantity) as 'Wartosc_zamowienia', IIF (SUM(UnitPrice * Quantity) > 100000, 'Duze', 'Male') as 'Wielkosc_zamowienia'
FROM [Order Details]
INNER JOIN Orders 
ON [Order Details].OrderID = Orders.OrderID 
GROUP BY  MONTH(OrderDate)
ORDER BY MONTH(Orders.OrderDate)