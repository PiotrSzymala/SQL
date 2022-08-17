------------------------------------------------------------------------------------------
---------- DIAGRAM BAZY
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
---------- Wyświetl dane wszystkich pracowników.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT * 
FROM dbo.Employees



------------------------------------------------------------------------------------------
---------- Wyświetl produkty których cena (z podatkiem VAT) jest większa niż 49 
---------- i mniejsza niż 99.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT * 
FROM dbo.Products
WHERE UnitPrice * 1.24 > 49 and UnitPrice * 1.24 < 99



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę jednostkową,  
---------- walutę (dodaj kolumnę), jednostek w magazynie dla produktów których  
---------- cena (z podatkiem VAT) jest większa niż 49 i mniejsza niż 99.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT ProductName, QuantityPerUnit, UnitPrice, '$' as 'waluta', UnitsInStock
FROM dbo.Products
WHERE UnitPrice * 1.24 > 49 AND  UnitPrice * 1.24 < 99

------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę jednostkową,  
---------- walutę (dodaj kolumnę), jednostek w magazynie dla produktów których  
---------- cena (z podatkiem VAT) jest większa niż 49 i mniejsza niż 99.
---------- Dodaj alias dla dodanej kolumny.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT ProductName, QuantityPerUnit, UnitPrice, '$' as 'waluta', UnitsInStock
FROM dbo.Products
WHERE UnitPrice * 1.24 > 49 AND  UnitPrice * 1.24 < 99


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę produktu, ilość na jednostkę, cenę netto (cena jednostkowa), 
---------- cenę brutto (cena jednostkowa z podatkiem VAT), walutę, jednostek w magazynie 
---------- dla produktów, których cena z podatkiem VAT jest większa niż 49 
---------- i mniejsza niż 99. Dodaj aliasy dla dodanych kolumny.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT ProductName, QuantityPerUnit, UnitPrice, UnitPrice * 1.24 as 'Cena_brutto' , '$' as 'waluta', UnitsInStock
FROM dbo.Products
WHERE UnitPrice * 1.24 > 49 AND  UnitPrice * 1.24 < 99


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę klienta wraz z jego pełnym adresem (ulica, miasto, kod pocztowy).
---------- Wyniki posortuj względem miasta.
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------

SELECT ContactName, Customers.Address , City, PostalCode
FROM Customers
Order by City


------------------------------------------------------------------------------------------
---------- Wyświetl produkty których nazwa zaczyna się na literę "b" lub "s".
------------------------------------------------------------------------------------------
---------- 10 rows
------------------------------------------------------------------------------------------

SELECT ProductName
FROM Products
WHERE ProductName like 'b%' or ProductName like 's%'

--------- lub

SELECT ProductName
FROM Products
WHERE LEFT(ProductName, 1) like 'b' or LEFT(ProductName, 1) like 's'


------------------------------------------------------------------------------------------
---------- Wyświetl produkty których nazwa zaczyna się na literę z przedziału "b" - "s".
------------------------------------------------------------------------------------------
---------- 64 rows
------------------------------------------------------------------------------------------

SELECT ProductName
FROM Products
WHERE ProductName >= 'b%' and ProductName < 't%'
 


------------------------------------------------------------------------------------------
---------- Wyświetl nazwy firmy klienckich oraz liczbę znaków ich nazwy.
---------- Wyniki posortuj malejąco względem drugiej kolumny. 
------------------------------------------------------------------------------------------
---------- LEN()
------------------------------------------------------------------------------------------
---------- 91 rows
------------------------------------------------------------------------------------------

SELECT CompanyName , LEN(CompanyName) 
FROM Customers
ORDER BY LEN(CompanyName) desc
 



------------------------------------------------------------------------------------------
---------- Wyświetl nazwę kategorii oraz jej skrót składający się z 3 pierwszych liter.
------------------------------------------------------------------------------------------
---------- LEFT()
------------------------------------------------------------------------------------------
---------- 8 rows
------------------------------------------------------------------------------------------

SELECT CategoryName, LEFT(CategoryName,3) as 'skrot'
FROM Categories


------------------------------------------------------------------------------------------
---------- Wyświetl imię i nazwisko pracownika 
---------- oraz skrót imienia składający się z pierwszej i ostatniej litery.
------------------------------------------------------------------------------------------
---------- LEFT(), RIGHT()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT LastName, FirstName, LEFT(FirstName, 1) + RIGHT(FirstName, 1) as 'skrót_imienia'  
FROM Employees

 


------------------------------------------------------------------------------------------
---------- Wyświetl nazwę dostawcy 
---------- oraz pierwsze 5 liter (czyli litery 1,2,3,4,5) nazwy firmy.
------------------------------------------------------------------------------------------
---------- SUBSTRING()
------------------------------------------------------------------------------------------
---------- 29 rows
------------------------------------------------------------------------------------------
SELECT ContactName, SUBSTRING(CompanyName,  1, 5) 
FROM Suppliers




------------------------------------------------------------------------------------------
---------- Czyszczenie białych znaków.
------------------------------------------------------------------------------------------
---------- LTRIM()
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
SELECT ' QWERTY' AS 'napis + spacja', 
	LEN(' QWERTY') AS 'długość napisu ze spacją', 
	LTRIM(' QWERTY') AS 'napis bez spacji', 
	LEN(LTRIM(' QWERTY')) AS 'długość napisu bez spacji'


------------------------------------------------------------------------------------------
---------- Wyświetl dane pracowników, zamień kraj "UK" na "United Kingdom".
------------------------------------------------------------------------------------------
---------- REPLACE()
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT  LastName,
        FirstName,
        Title,
        REPLACE(Country, 'UK', 'United Kingdom')as 'Replaced_Country'
FROM Employees