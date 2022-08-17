------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu i odpowiadającej mu kategorii.
------------------------------------------------------------------------------------------
---------- INNER JOIN
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT Products.ProductName, Categories.CategoryID
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu i dostawcy.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT Products.ProductName, Suppliers.CompanyName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, dostawcy i kategorii dla firm zawierających w nazwie
---------- wyraz "Pavlova".
------------------------------------------------------------------------------------------
---------- 5 rows
------------------------------------------------------------------------------------------

SELECT Products.ProductName, Suppliers.CompanyName, Categories.CategoryName
FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Suppliers.CompanyName like '%Pavlova%'

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, opis kategorii i nazwę dostawcy.
---------- Uwzględnij tylko firmy zawierające w nazwie napis "Pavlova".
---------- Ogranicz się do produktów z kategorii: "beverages", "seafood".
------------------------------------------------------------------------------------------
---------- 2 rows
------------------------------------------------------------------------------------------

SELECT Products.ProductName, Categories.Description,  Suppliers.CompanyName
FROM Products
INNER JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Suppliers.CompanyName like '%Pavlova%' and Categories.CategoryName like 'beverages' or Suppliers.CompanyName like '%Pavlova%' and Categories.CategoryName like 'seafood'

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, cenę jednostkową oraz cenę na zamówieniu.
---------- Wybierz tylko produkty z kategorii "beverages".
------------------------------------------------------------------------------------------
---------- 404 rows
------------------------------------------------------------------------------------------

SELECT Products.ProductName, Products.UnitPrice, [Order Details].UnitPrice as 'cena_na_zamowieniu'
FROM Products
INNER JOIN [Order Details] on Products.ProductID = [Order Details].ProductID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName like 'beverages'



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, cenę jednostkową oraz cenę na zamówieniu.
---------- Wybierz tylko produkty z kategorii "beverages".
---------- Uwzględnij tylko unikalne rekordy.
------------------------------------------------------------------------------------------
---------- 24 rows
------------------------------------------------------------------------------------------

SELECT DISTINCT Products.ProductName, Products.UnitPrice, [Order Details].UnitPrice as 'cena_na_zamowieniu'
FROM Products
INNER JOIN [Order Details] on Products.ProductID = [Order Details].ProductID
INNER JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName like 'beverages'

------------------------------------------------------------------------------------------
---------- Wyświetl wszystkich klientów oraz datę składanych zamówień (jeśli istnieje).
------------------------------------------------------------------------------------------
---------- LEFT JOIN
------------------------------------------------------------------------------------------
---------- 832 rows
------------------------------------------------------------------------------------------

SELECT Customers.*, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta oraz liczbę jego zamówień.
------------------------------------------------------------------------------------------
---------- 89 rows
------------------------------------------------------------------------------------------

SELECT DISTINCT Customers.ContactName, COUNT(Orders.OrderID) as 'liczba_zamowien'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName
HAVING COUNT(Orders.OrderID) not like '0'

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta i sumę opłat frachtowych dla zamówień z roku 1996.
------------------------------------------------------------------------------------------
---------- 67 rows
------------------------------------------------------------------------------------------

SELECT Customers.ContactName, SUM(Orders.Freight) as 'Suma_oplat' 
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE year(Orders.OrderDate) = 1996
GROUP BY Customers.ContactName 