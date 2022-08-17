------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów.
------------------------------------------------------------------------------------------
---------- COUNT()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------

SELECT COUNT(CustomerID)
FROM Customers



------------------------------------------------------------------------------------------
---------- Wyświetl liczbę klientów posiadających fax.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------

SELECT COUNT(CustomerID)
FROM Customers
WHERE Fax IS NOT NULL


------------------------------------------------------------------------------------------
---------- Wyświetl liczbę zrealizowanych zamówień do poszczególnych miast.
------------------------------------------------------------------------------------------
---------- GROUP BY
------------------------------------------------------------------------------------------
---------- Użycie funkcji agregacji wymaga klauzuli GROUP BY.
---------- W klauzuli GROUP BY należy wskazać wszystkie elementy 
---------- które znajdują się w klauzuli SELECT i NIE należą do funkcji agregacji.
------------------------------------------------------------------------------------------
---------- 70 rows
------------------------------------------------------------------------------------------
 
 SELECT ShipCountry, ShipCity, COUNT(ShippedDate) as 'Number_of_completed_orders'
 FROM Orders
 WHERE ShippedDate IS NOT NULL
 GROUP BY ShipCity, ShipCountry


------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i sumę jego opłat frachtowych,
---------- dla zamówień z roku 1998. Sortowanie od największej opłaty.
------------------------------------------------------------------------------------------
---------- SUM()
------------------------------------------------------------------------------------------
---------- 81 rows
------------------------------------------------------------------------------------------

SELECT CustomerID, SUM(Freight) as 'price_sum'
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY (CustomerID)
ORDER BY price_sum DESC


------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i sumę jego opłat frachtowych,
---------- dla zamówień z dnia 17 marca. Identyfikator klienta nie może zawierać "aa". 
---------- Sortowanie od najniższej do najwyższej opłaty (rosnące).
------------------------------------------------------------------------------------------
---------- 4 rows
------------------------------------------------------------------------------------------

SELECT CustomerID, SUM(Freight) as 'price_sum'
FROM Orders
WHERE MONTH(OrderDate) = 03 and DAY(OrderDate) = 17 and CustomerID NOT LIKE '%aa%'
GROUP BY (CustomerID)
ORDER BY price_sum ASC



------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator klienta i średnią opłatę frachtową dla poszczególnych 
---------- miesięcy.
------------------------------------------------------------------------------------------
---------- AVG()
------------------------------------------------------------------------------------------
---------- 526 rows
------------------------------------------------------------------------------------------

SELECT CustomerID, Month(OrderDate) as 'month', AVG(Freight) as 'srednia'
FROM Orders
GROUP BY CustomerID, Month(OrderDate)


------------------------------------------------------------------------------------------
---------- Wyświetl identyfikator kategorii, najmniejszą, największą i średnią cenę oraz 
---------- liczbę produktu w poszczególnych kategoriach. 
---------- Wyniki posortuj malejąco po licznie produktów.
------------------------------------------------------------------------------------------
---------- MAX(), MIN()
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------

SELECT CategoryID, MIN(UnitPrice) as 'min', AVG(UnitPrice) as 'avg', MAX(UnitPrice) as 'max', COUNT(CategoryID) as 'ilosc_produktow'
FROM Products
GROUP BY CategoryID
ORDER BY ilosc_produktow DESC


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, jego cenę, nazwę kategorii do której należy oraz
---------- opis kategorii.
------------------------------------------------------------------------------------------
---------- INNER JOIN
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT ProductName, UnitPrice, CategoryName, Description
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID 

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------




	
------------------------------------------------------------------------------------------
---------- Wyświetl datę zamówienia, identyfikator klienta, cenę jaką zapłacono za produkt,
---------- zastosowaną zniżkę, nazwę produktu i jego standardową cenę.
------------------------------------------------------------------------------------------
---------- 2155 rows
------------------------------------------------------------------------------------------
SELECT Orders.OrderDate, Orders.CustomerID, [Order Details].UnitPrice, [Order Details].UnitPrice * [Order Details].Quantity as 'cena_razy_ilosc' , [Order Details].Discount, Products.ProductName, Products.UnitPrice --- Mozna by jeszcze policzyc cene po znice ale w niektorych kolumnach discount przyjmuje wartosc 0 
FROM (([Order Details]
INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID)
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID)