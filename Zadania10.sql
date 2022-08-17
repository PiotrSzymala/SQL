------------------------------------------------------------------------------------------
---------- Dodaj do tabeli Products kolumnę "Kategoria".
---------- Uzupełnij dodaną kolumnę odpowiednimi nazwami kategorii.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

ALTER TABLE Products
ADD Kategoria nvarchar(20)

UPDATE Products
SET Kategoria = (SELECT CategoryName FROM Categories WHERE Products.CategoryID = Categories.CategoryID)

------------------------------------------------------------------------------------------
---------- Przekopiuj dane z tabeli Products do nowej tabeli Produkty.
---------- Z tabeli Produkty usuń kolumnę CategoryID.
------------------------------------------------------------------------------------------
---------- 77 rows
------------------------------------------------------------------------------------------

SELECT * into Produkty 
FROM Products

ALTER TABLE Produkty
DROP COLUMN CategoryID

---------- lub

------------------------------------------------------------------------------------------
---------- Usuń kolumnę Photo z tabeli Employees.
------------------------------------------------------------------------------------------

ALTER TABLE Employees
DROP COLUMN Photo
-- Rozważyłbym tu jeszcze usunięcie kolumny PhotoPath, ponieważ nie ma ona sensu, gdy wykasowaliśmy kolumnę Photo.

------------------------------------------------------------------------------------------
---------- Dodaj kolumnę "Wartosc" do tabeli Produkty.
---------- Kolumna "Wartosc" jest iloczynem UnitsInStock i UnitPrice.
------------------------------------------------------------------------------------------

ALTER TABLE Produkty
ADD Wartosc money

UPDATE Produkty
SET Wartosc = Produkty.UnitPrice * Produkty.UnitsInStock

------------------------------------------------------------------------------------------
---------- Stwórz tabele Student składającą się z 5 kolumn:
---------- ID (klucz główny, nadawany automatycznie), 
---------- Imie (wartość nie pusta), 
---------- Nazwisko (wartość nie pusta), 
---------- Pesel (unikalna liczba), 
---------- Miasto (domyślnie "Katowice").
---------- Dodaj przykładowe dane.
------------------------------------------------------------------------------------------

CREATE TABLE Student (
	ID int Identity,
	Imie nvarchar(255) NOT NULL,
	Nazwisko nvarchar(255) NOT NULL,
	Pesel bigint unique,
	Miasto varchar(255) default 'Katowice')

	INSERT INTO Student
	VALUES ('Kamil', 'TumuLec', '00286453897', 'Warszawa')

------------------------------------------------------------------------------------------
---------- Dodaj przykładowe dane testowe do tabeli Student - trzy wiersze.
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 0 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------
---------- 1 rows
------------------------------------------------------------------------------------------

INSERT INTO Student(Imie, Nazwisko, Pesel) 
VALUES ('Jan', 'Łoś', '54856874123'),  
	   ('Wojciech', 'Suchodolski', '68453214568'),
	   ('Krzysztof', 'Kononowicz', '54654532154') 

------------------------------------------------------------------------------------------
---------- Wyświetla dane z tabeli Student. Usuń tabelę.
------------------------------------------------------------------------------------------
---------- 3 rows
------------------------------------------------------------------------------------------
	   
SELECT * FROM Student
DROP TABLE Student