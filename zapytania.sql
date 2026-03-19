CREATE TABLE Klicenci (
    Klient_id INT PRIMARY KEY AUTO_INCREMENT,
    Imię VARCHAR(50),
    Nazwisko VARCHAR(50),
    Pesel INT,
    Adres_korespondencyjny VARCHAR(100),
    Telefon INT,
    Email VARCHAR(100)
    )

CREATE TABLE Nieruchomości (
    Nieruchomość_id INT PRIMARY KEY AUTO_INCREMENT,
    Adres VARCHAR(100),
    Typ_nieruchomości VARCHAR(100),
    Liczba_mieszkańców INT
    )

CREATE TABLE Deklaracje (
    Deklaracja_id INT PRIMARY KEY AUTO_INCREMENT,
    Data_złożenia DATETIME,
    Typ_odpadów VARCHAR(100),
    Częstotliwość_odbioru VARCHAR(45),
    Stawka DECIMAL(10,2)
    )

CREATE TABLE Harmonogram_wywozu (
    Harmonogram_id INT PRIMARY KEY AUTO_INCREMENT,
    Data_wywozu DATETIME,
    Typ_odpadów VARCHAR(45)
    )

CREATE TABLE Faktury (
    Faktura_id INT PRIMARY KEY AUTO_INCREMENT,
    Numer INT,
    Data_wystawienia DATETIME,
    Kwota DECIMAL(10,2),
    Status_faktury VARCHAR(45)
    )

ALTER TABLE nieruchomości
ADD Klient_id INT;

ALTER TABLE nieruchomości
ADD CONSTRAINT fk_nieruchomości_klienci
FOREIGN KEY (Klient_id)
REFERENCES Klienci(id)

ALTER TABLE nieruchomości
ADD Deklaracja_id INT;

ALTER TABLE nieruchomości
ADD CONSTRAINT fk_nieruchomości_deklaracje
FOREIGN KEY (Deklaracja_id)
REFERENCES Deklaracje(id)

ALTER TABLE	faktury
ADD Klienci_id INT;

ALTER TABLE faktury
ADD CONSTRAINT fk_faktury_klienci
FOREIGN KEY (Klient_id)
REFERENCES klienci(id)

ALTER TABLE harmonogram_wywozu
ADD Nieruchomości_id INT;

ALTER TABLE harmonogram_wywozu
ADD CONSTRAINT fk_harmonogram_wywozu_nieruchomości
FOREIGN KEY (Nieruchomość_id)
REFERENCES nieruchomości(id)

ALTER TABLE deklaracje
ADD faktura_id INT

ALTER TABLE deklaracje
ADD CONSTRAINT fk_deklaracje_faktury
FOREIGN KEY (faktura_id)
REFERENCES faktury(faktura_id)

INSERT INTO klienci (imię, nazwisko, pesel, adres_korespondencyjny, telefon, email)
VALUES ("Kacper", "Baranowski", "08260421987", "Witkowo ul. Kosynierów Miłosławskich 5", "670321094", "kbaranowski4@gmail.com")

INSERT INTO klienci (imię, nazwisko, pesel, adres_korespondencyjny, telefon, email)
VALUES ("Robert", "Nowak", "94021599083", "Witkowo ul. Dworcowa 9/2", "940326574", "robertn33@gmail.com")

INSERT INTO nieruchomości (adres, typ_nieruchomości, liczba_mieszkańców, klient_id)
VALUES ("Witkowo ul. Kosynierów Miłosławskich 5", "dom jednorodzinny", "3", "1")

INSERT INTO faktury (Numer, Data_wystawienia, Kwota, Status_faktury, Klient_id)
VALUES ("001", "2026-03-13", "178.09", "Opłacona", "1")

INSERT INTO deklaracje (Data_złożenia, Typ_odpadów, Częstotliwość_odbioru, Stawka)
VALUES ("2026-03-10", "Plastik, Szkło, Papier", "Raz w miesiącu", "63.00")

INSERT INTO harmonogram_wywozu (Data_wywozu, Typ_odpadów, Nieruchomość_id)
VALUES ("2026-03-20", "Stałe", "1")

SELECT imię, nazwisko, pesel FROM klienci

UPDATE klienci
SET pesel = "08260413489"
WHERE klient_id = 1

DELETE FROM klienci
WHERE klient_id = 2

SELECT k.imię, k.nazwisko, f.kwota FROM klienci k
LEFT JOIN faktury f ON k.klient_id = f.klient_id



