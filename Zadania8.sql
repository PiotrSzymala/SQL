------------------------------------------------------------------------------------------
---------- Stwórz widok wyświetlający imię, nazwisko, 
---------- stanowisko i datę zatrudnienia pracowników.
------------------------------------------------------------------------------------------
---------- CREATE VIEW
------------------------------------------------------------------------------------------

CREATE VIEW Pracownicy
AS
SELECT FirstName, LastName, Title, HireDate
FROM Employees



------------------------------------------------------------------------------------------
---------- Wyświetl dane personalne pracowników. Wykorzystaj wcześniej stworzony widok.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT * 
FROM Pracownicy

------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko i rok zatrudnienia pracowników.
------------------------------------------------------------------------------------------
---------- 9 rows
------------------------------------------------------------------------------------------

SELECT FirstName, LastName, HireDate
FROM Pracownicy

------------------------------------------------------------------------------------------
---------- Stwórz widok wyświetlający dane pracowników z regionu "WA".
------------------------------------------------------------------------------------------

CREATE VIEW Pracownicy_WA
AS
SELECT *
FROM Employees
WHERE Region like 'WA'

------------------------------------------------------------------------------------------
---------- Wyświetl dane pracowników z regionu "WA".
------------------------------------------------------------------------------------------
---------- 5 rows
------------------------------------------------------------------------------------------

SELECT * 
FROM Pracownicy_WA

------------------------------------------------------------------------------------------
---------- Wyświetl imię, nazwisko, miasto i opis terytorium pracowników. 
---------- Wykorzystaj wcześniej stworzony widok.
------------------------------------------------------------------------------------------
---------- 20 rows
------------------------------------------------------------------------------------------

SELECT FirstName, LastName, City, Territories.TerritoryDescription
FROM Pracownicy_WA
JOIN EmployeeTerritories on Pracownicy_WA.EmployeeID = EmployeeTerritories.EmployeeID
JOIN Territories on EmployeeTerritories.TerritoryID = Territories.TerritoryID

------------------------------------------------------------------------------------------
---------- Wyświetl kraj, liczbę zamówień i % udział zamówień.
------------------------------------------------------------------------------------------
---------- 21 rows
------------------------------------------------------------------------------------------
---------- DECLARE, SET
------------------------------------------------------------------------------------------

DECLARE @liczba_wszystkich_zam INT = (SELECT COUNT(OrderID) FROM Orders)
SELECT ShipCountry ,COUNT(OrderID) AS 'Liczba_Zamowien' ,100 * CAST(COUNT(OrderID)AS FLOAT) / @liczba_wszystkich_zam AS 'Udzial_zamowien_w_%'
FROM Orders
GROUP BY ShipCountry