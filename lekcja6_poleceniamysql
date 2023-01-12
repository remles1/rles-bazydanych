Zad 1
DELIMITER //
CREATE TRIGGER waga_wieksza_od_zero
BEFORE INSERT ON kreatura

FOR EACH ROW

BEGIN
IF NEW.waga < 0 THEN
SET NEW.waga = 0;
END IF;
END;// 
DELIMITER ;

DELIMITER //
CREATE TRIGGER waga_wieksza_od_zero_update
BEFORE UPDATE ON kreatura

FOR EACH ROW

BEGIN
IF NEW.waga < 0 THEN
SET NEW.waga = 0;
END IF;
END;// 
DELIMITER ;
 
Zad 2
DELIMITER //
CREATE TRIGGER archiwum_trigger AFTER DELETE ON wyprawa
FOR EACH ROW
BEGIN
INSERT INTO archiwum_wypraw VALUES(OLD.id_wyprawy, OLD.nazwa, OLD.data_rozpoczecia, OLD.data_zakonczenia, OLD.kierownik);
END;//
DELIMITER ;

Zad 3
DELIMITER //
CREATE TRIGGER archiwum_trigger AFTER DELETE ON wyprawa
FOR EACH ROW
BEGIN
DECLARE kierownik_stary INT;
DECLARE kierownik_nazwa VARCHAR(20);
SET kierownik_stary = OLD.kierownik;
SET kierownik_nazwa = (SELECT kreatura.nazwa FROM wyprawa JOIN kreatura ON wyprawa.kierownik=kreatura.idKreatury AND kierownik=kierownik_stary);
INSERT INTO archiwum_wypraw VALUES(OLD.id_wyprawy, OLD.nazwa, OLD.data_rozpoczecia, OLD.data_zakonczenia, kierownik_nazwa);

END;//


DELIMITER ;
