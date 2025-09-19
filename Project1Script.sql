CREATE DATABASE PhotographyRental;
USE PhotographyRental;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Equipment (
    EquipmentID INT AUTO_INCREMENT PRIMARY KEY,
    EquipmentName VARCHAR(100) NOT NULL,
    DailyRate DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) DEFAULT 'available'
);

CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EquipmentID INT,
    StartDate DATE,
    EndDate DATE,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT,
    Amount DECIMAL(10,2),
    Method VARCHAR(50),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

INSERT INTO Customers (Name, Email, Phone)
VALUES ('Alex Harper','alex@example.com','555-1111'),
       ('Casey Lin','casey@example.com','555-2222');
       
INSERT INTO Equipment (EquipmentName, DailyRate, Status)
VALUES ('Canon EOS R6 Camera',45.00,'available'),
       ('Sony A7 IV Camera',50.00,'available'),
       ('Canon 24-70mm Lens',20.00,'available');
       
INSERT INTO Reservations (CustomerID, EquipmentID, StartDate, EndDate, TotalCost)
VALUES (1,1,'2025-09-20','2025-09-22',90.00),
       (2,3,'2025-09-21','2025-09-22',20.00);
       
INSERT INTO Payments (ReservationID, Amount, Method)
VALUES (1,50.00,'Card');

SHOW TABLES;
DESCRIBE Customers;
DESCRIBE Reservations;
DESCRIBE Payments;
DESCRIBE Equipment;
SELECT * FROM Customers;
SELECT * FROM Equipment;
SELECT * FROM Reservations;
SELECT * FROM Payments;

