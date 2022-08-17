------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------
SELECT Customers.CompanyName
,COUNT(Orders.OrderID) AS 'liczba zamowien'
,(SELECT count(OrderID) FROM Orders) AS 'zamowienia'
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName
------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, datę urodzenia, numer domowy oraz identyfikator
---------- zwierzchnika, dla pracowników młodszych od pracownika o nazwisku "King".
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
SELECT
FirstName
,LastName
,BirthDate
,HomePhone
,ReportsTo
FROM Employees
WHERE BirthDate > (SELECT BirthDate from Employees WHERE LastName LIKE '%King%')
------------------------------------------------------------------------------------------
---------- Wyświetl dane klienta który złożył największe zamówienie.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- Poprawne rozwiązanie
------------------------------------------------------------------------------------------
SELECT TOP 1 Customers.CompanyName,
SUM([Order Details].UnitPrice * [Order Details].Quantity) as 'Wartosc'
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY Customers.CompanyName, [Order Details].OrderID
ORDER BY Wartosc DESC
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
---------- Wyświetl liczbę produktów z kategorii która ma ich najwięcej
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT MAX(Products.quantityofproducts) as 'najwieksza_liczba_produktow'

FROM (SELECT COUNT(*) as 'quantityofproducts' FROM Products GROUP BY CategoryID)
Products
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------