------------------------------------------------------------------------------------------
---------- Stwórz bazę danych "Uczelnia".
------------------------------------------------------------------------------------------

CREATE DATABASE Uczelnia

------------------------------------------------------------------------------------------
---------- Zmień nazwę bazy danych "Uczelnia" na "UEK".
------------------------------------------------------------------------------------------

ALTER DATABASE Uczelnia
MODIFY NAME = UEK

------------------------------------------------------------------------------------------
---------- Usuń bazę danych "UEK".
------------------------------------------------------------------------------------------

DROP DATABASE UEK

------------------------------------------------------------------------------------------
---------- Stwórz tabelę Ocena z następującymi kolumnami:
---------- OcenaID - klucz główny, nadawany automatycznie od 1 co 1.
---------- Nazwa - wartość tekstowa o zmiennej długości, do 20 znaków.
---------- Wartosc - wartość zmiennoprzecinkowa.
---------- Uzupełnij tabelę ocenami.
------------------------------------------------------------------------------------------

CREATE TABLE Ocena
(OcenaID INT IDENTITY(1,1) PRIMARY KEY ,Nazwa VARCHAR(20) ,Wartosc FLOAT)
INSERT INTO Ocena(Nazwa, Wartosc)
VALUES 
('Bazy Danych', 5.0),
('Analiza Matematyczna', 4.0),
('Język hiszpański', 4.5),
('Język angielski', 5.0),
('Algebra',3.5 )

------------------------------------------------------------------------------------------
---------- Stwórz tabelę Oceny z następującymi kolumnami:
---------- OcenyID - klucz główny, nadawany automatycznie od 1 co 1.
---------- OcenaIDFK - klucz obcy z tabeli Ocena.
---------- Student - liczba całkowita, domyślnie 3113.
---------- Nauczyciel - liczba całkowita, niepusta, większa od 10.
---------- Uzupełnij tabelę danymi.
------------------------------------------------------------------------------------------

CREATE TABLE Oceny
 (OcenyID INT IDENTITY (1,1) PRIMARY KEY, 
 OcenaIDFK INT FOREIGN KEY REFERENCES Ocena(OcenaID), 
 Student INT DEFAULT 3113, 
 Nauczyciel INT CHECK (Nauczyciel > 10))
 
 INSERT INTO Oceny(Student, Nauczyciel)
 VALUES(42135, 11),
 (23361,12),
 (5444342, 11),
 (6321,13)

 SELECT  * FROM Oceny
------------------------------------------------------------------------------------------
---------- Stwórz tabelę Nauczyciel z następującymi kolumnami:
---------- NauczycielID - klucz główny, nadawany automatycznie od 1 co 1.
---------- Imie - pole tekstowe o zmiennej długości, maksymalnie 30 znaków.
---------- Nazwisko - pole tekstowe o zmiennej długości, maksymalnie 30 znaków.
---------- KodPocztowy - pole tekstowe o długości 6 znaków, sprawdzenie poprawności.
---------- StopienNaukowy - pole tekstowe o zmiennej długości, maksymalnie 30 znaków,
---------- może zawierać tylko: "mgr", "dr", "dr hab.", "prof.".
---------- Uzupełnij tabelę danymi.
------------------------------------------------------------------------------------------

CREATE TABLE Nauczyciel
(NauczycielID INT IDENTITY (1,1) PRIMARY KEY,
Imie VARCHAR(30),
Nazwisko VARCHAR(30),
KodPocztowy CHAR(6), CHECK(KodPocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'),
StopienNaukowy VARCHAR(30) CHECK(StopienNaukowy LIKE 'mgr'OR StopienNaukowy LIKE 'dr' OR StopienNaukowy LIKE 'dr hab.' OR   StopienNaukowy LIKE 'prof.'))

INSERT INTO Nauczyciel(Imie, Nazwisko,KodPocztowy,StopienNaukowy)
Values ('Piotr', 'Glenc', '45-870', 'mgr'),
('Kacper', 'Zagala', '42-420', 'mgr'),
('Tadeusz', 'Trzaskalik', '21-115','prof.'),
('Maciej', 'Mitrega', '28-753','prof.'),
('Mariusz', 'Pudzianowski', '96-230','mgr'),
('Kamil', 'Slimak', '58-328','dr hab.'),
('August', 'Oetker', '63-846','dr')