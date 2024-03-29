Zad 1 
drop table kreatura;
CREATE table kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE sektor AS SELECT * FROM wikingowie.sektor;
CREATE TABLE wyprawa AS SELECT * FROM wikingowie.wyprawa;
SELECT nazwa FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury = uczestnicy.id_uczestnika WHERE uczestnicy.id_uczestnika IS NULL;
SELECT wyprawa.nazwa, sum(ekwipunek.ilosc) FROM wyprawa JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy JOIN ekwipunek ON ekwipunek.idKreatury = uczestnicy.id_uczestnika GROUP BY wyprawa.id_wyprawy;

Zad 2 
SELECT wyprawa.nazwa, GROUP_CONCAT(kreatura.nazwa), COUNT(id_uczestnika) FROM wyprawa JOIN uczestnicy ON wyprawa.id_wyprawy
= uczestnicy.id_wyprawy JOIN kreatura ON uczestnicy.id_uczestnika = kreatura.idKreatury GROUP BY wyprawa.nazwa;
SELECT kreatura.nazwa, wyprawa.nazwa, etapy_wyprawy.sektor, sektor.nazwa FROM wyprawa JOIN etapy_wyprawy ON wyprawa.id_wyprawy = etapy_wyprawy.idWyprawy JOIN kreatura ON wyprawa.kierownik = kreatura.idKreatury JOIN sektor on etapy_wyprawy.sektor = sektor.id_sektora ORDER BY wyprawa.data_rozpoczecia ASC, etapy_wyprawy.kolejnosc ASC;

Zad 3
SELECT x.sektor, sektor.nazwa, COUNT(etapy_wyprawy.sektor) FROM (SELECT id_sektora AS sektor FROM sektor UNION SELECT etapy_wyprawy.sektor FROM etapy_wyprawy) AS x LEFT JOIN etapy_wyprawy ON x.sektor = etapy_wyprawy.sektor JOIN sektor ON x.sektor = sektor.id_sektora GROUP BY x.sektor;
SELECT kreatura.nazwa,IF(COUNT(uczestnicy.id_uczestnika)>0 ,'bral udzial w wyprawie' , 'nie bral udzialu w wyprawie') AS 'czy bral udzial' FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury = uczestnicy.id_uczestnika GROUP BY kreatura.idKreatury;

Zad 4
SELECT wyprawa.nazwa, LENGTH(GROUP_CONCAT(dziennik SEPARATOR '')) FROM etapy_wyprawy JOIN wyprawa ON etapy_wyprawy.idWyprawy = wyprawa.id_wyprawy GROUP BY idWyprawy HAVING(LENGTH(GROUP_CONCAT(dziennik)) < 400);
SELECT wyprawa.nazwa, SUM(ekwipunek.ilosc * zasob.waga) / (SELECT COUNT(id_uczestnika) FROM uczestnicy WHERE uczestnicy.id_wyprawy = wyprawa.id_wyprawy GROUP BY uczestnicy.id_wyprawy) FROM wyprawa INNER JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy INNER JOIN ekwipunek ON uczestnicy.id_uczestnika = ekwipunek.idKreatury INNER JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu GROUP BY wyprawa.id_wyprawy;

Zad 5
SELECT wyprawa.nazwa, kreatura.nazwa, datediff(wyprawa.data_rozpoczecia, kreatura.dataUr) FROM wyprawa INNER JOIN etapy_wyprawy ON wyprawa.id_wyprawy = etapy_wyprawy.idWyprawy INNER JOIN uczestnicy ON uczestnicy.id_wyprawy = wyprawa.id_wyprawy INNER JOIN kreatura ON kreatura.idKreatury = uczestnicy.id_uczestnika WHERE sektor = 7 ORDER BY wyprawa.nazwa;
