Zad 1
CREATE TABLE kreatura LIKE wikingowie.kreatura;
INSERT INTO kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob AS SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek AS SELECT * FROM wikingowie.ekwipunek;
SELECT * FROM zasob;
SELECT * from zasob WHERE rodzaj = 'jedzenie';
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);

Zad 2
SELECT * FROM kreatura WHERE rodzaj != 'wiedzma' and udzwig > 50;
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' and udzwig BETWEEN 30 and 80;

Zad 3
select * from zasob where MONTH(dataPozyskania) IN(7,8);
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
SELECT * FROM kreatura ORDER BY dataUr ASC LIMIT 5;

Zad 4
SELECT DISTINCT rodzaj FROM zasob;
SELECT nazwa, rodzaj FROM kreatura WHERE rodzaj LIKE 'wi%';
SELECT ilosc*waga FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

Zad 5
SELECT WAGA*0.7 AS 'waga netto', WAGA*0.3 AS 'masa odpadkow' FROm zasob;
SELECT * FROM zasob where rodzaj IS NULL;
SELECT DISTINCT rodzaj FROM zasob WHERE nazwa LIKE 'Ba%' or nazwa LIKE '%os' ORDER BY rodzaj ASC;

