-- Populating the Librarybranch table
SET IDENTITY_INSERT Librarybranch ON;
INSERT INTO Librarybranch (BranchID, Name, Location, Phone) VALUES
(1, 'Main Branch', 'Downtown', '1234567890'),
(2, 'Westside Branch', 'West City', '0987654321'),
(3, 'Eastside Branch', 'East Town', '5678901234'),
(4, 'North Branch', 'North Avenue', '4561237890'),
(5, 'South Branch', 'South Park', '7896541230'),
(6, 'Central Branch', 'City Center', '2345678901'),
(7, 'Hilltop Branch', 'Hilltop Road', '6543210987'),
(8, 'Lakeside Branch', 'Lakeside View', '3217896540'),
(9, 'Valley Branch', 'Valley Drive', '9876543210'),
(10, 'Riverside Branch', 'Riverside Street', '8765432190'),
(11, 'Old Town Branch', 'Old Town', '3456789012'),
(12, 'New City Branch', 'New City', '7654321098'),
(13, 'Greenfield Branch', 'Greenfield Avenue', '8765432109'),
(14, 'Sunnyvale Branch', 'Sunnyvale Lane', '6549873210'),
(15, 'Meadow Branch', 'Meadow Drive', '4321098765');
SET IDENTITY_INSERT Librarybranch OFF;

-- Populating the Genre table
SET IDENTITY_INSERT Genre ON;
INSERT INTO Genre (GenreID, GenreName) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Mystery'),
(4, 'Fantasy'),
(5, 'Science Fiction'),
(6, 'Biography'),
(7, 'History'),
(8, 'Romance'),
(9, 'Thriller'),
(10, 'Horror'),
(11, 'Self-Help'),
(12, 'Children''s'),
(13, 'Poetry'),
(14, 'Adventure'),
(15, 'Graphic Novel');
SET IDENTITY_INSERT Genre OFF;

-- Populating the Shelf table
SET IDENTITY_INSERT Shelf ON;
INSERT INTO Shelf (ShelfID, Location, GenreID) VALUES
(1, 'A1', 1),
(2, 'A2', 2),
(3, 'A3', 3),
(4, 'B1', 4),
(5, 'B2', 5),
(6, 'B3', 6),
(7, 'C1', 7),
(8, 'C2', 8),
(9, 'C3', 9),
(10, 'D1', 10),
(11, 'D2', 11),
(12, 'D3', 12),
(13, 'E1', 13),
(14, 'E2', 14),
(15, 'E3', 15);
SET IDENTITY_INSERT Shelf OFF;

-- Populating the Book table
SET IDENTITY_INSERT Book ON;
INSERT INTO Book (BookID, Title, Author, ISBN, GenreID, ShelfID, PublicationYear, Stock, Status) VALUES
(1, 'The Great Adventure', 'John Doe', '978-3-16-148410-0', 1, 1, 2010, 10, 'available'),
(2, 'Mystery of the Mind', 'Jane Smith', '978-1-234-56789-7', 2, 2, 2015, 5, 'available'),
(3, 'Fantasy World', 'Alice Wonderland', '978-0-987-65432-1', 3, 3, 2020, 8, 'available'),
(4, 'Science Quest', 'Albert Newton', '978-3-21-098765-4', 4, 4, 2018, 7, 'available'),
(5, 'Historical Tales', 'Henry History', '978-2-22-222222-2', 5, 5, 2005, 4, 'available'),
(6, 'Romantic Evenings', 'Emily Heart', '978-3-44-555555-5', 6, 6, 2011, 9, 'available'),
(7, 'Thrilling Heights', 'Thriller Writer', '978-0-12-345678-9', 7, 7, 2017, 6, 'available'),
(8, 'Haunted Stories', 'Ghost Writer', '978-4-56-789123-0', 8, 8, 2019, 5, 'available'),
(9, 'Child''s Play', 'Toy Maker', '978-5-43-210987-6', 9, 9, 2021, 12, 'available'),
(10, 'Poetry Bliss', 'Poet Soul', '978-6-78-912345-8', 10, 10, 2000, 15, 'available'),
(11, 'Adventurous Tales', 'Daring Explorer', '978-1-11-111111-1', 11, 11, 2022, 11, 'available'),
(12, 'Life Guide', 'Wise Guru', '978-7-89-654321-2', 12, 12, 2016, 10, 'available'),
(13, 'Graphic Universe', 'Artist Mind', '978-8-12-987654-3', 13, 13, 2014, 14, 'available'),
(14, 'Sunny Days', 'Happy Soul', '978-9-23-123456-7', 14, 14, 2008, 13, 'available'),
(15, 'Green Fields', 'Nature Lover', '978-0-33-456789-0', 15, 15, 2003, 7, 'available');
SET IDENTITY_INSERT Book OFF;

-- Populating the Member table
SET IDENTITY_INSERT Member ON;
INSERT INTO Member (MemberID, Name, Email, Phone, MembershipDate, BranchID) VALUES
(1, 'John Smith', 'john.smith@example.com', '1112223333', '2023-01-01', 1),
(2, 'Alice Johnson', 'alice.johnson@example.com', '2223334444', '2023-02-15', 2),
(3, 'Bob Brown', 'bob.brown@example.com', '3334445555', '2023-03-10', 3),
(4, 'Emma Davis', 'emma.davis@example.com', '4445556666', '2023-04-05', 4),
(5, 'Chris Wilson', 'chris.wilson@example.com', '5556667777', '2023-05-20', 5),
(6, 'Olivia Taylor', 'olivia.taylor@example.com', '6667778888', '2023-06-15', 6),
(7, 'Liam Anderson', 'liam.anderson@example.com', '7778889999', '2023-07-01', 7),
(8, 'Sophia Martinez', 'sophia.martinez@example.com', '8889990000', '2023-08-25', 8),
(9, 'Ethan Garcia', 'ethan.garcia@example.com', '9990001111', '2023-09-10', 9),
(10, 'Mia Robinson', 'mia.robinson@example.com', '0001112222', '2023-10-05', 10),
(11, 'Jacob Clark', 'jacob.clark@example.com', '1231231234', '2023-11-20', 11),
(12, 'Isabella Lewis', 'isabella.lewis@example.com', '2342342345', '2023-12-15', 12),
(13, 'James Walker', 'james.walker@example.com', '3453453456', '2024-01-10', 13),
(14, 'Charlotte Young', 'charlotte.young@example.com', '4564564567', '2024-02-05', 14),
(15, 'Benjamin Hall', 'benjamin.hall@example.com', '5675675678', '2024-03-25', 15);
SET IDENTITY_INSERT Member OFF;

-- Populating the Borrow table
SET IDENTITY_INSERT Borrow ON;
INSERT INTO Borrow (BorrowID, BookID, MemberID, BorrowDate, DueDate, ReturnDate, FineAmount) VALUES
(1, 1, 1, '2024-01-01', '2024-01-15', NULL, NULL),
(2, 2, 2, '2024-01-05', '2024-01-20', NULL, NULL),
(3, 3, 3, '2024-01-10', '2024-01-25', NULL, NULL),
(4, 4, 4, '2024-01-15', '2024-01-30', NULL, NULL),
(5, 5, 5, '2024-01-20', '2024-02-05', NULL, NULL),
(6, 6, 6, '2024-01-25', '2024-02-10', NULL, NULL),
(7, 7, 7, '2024-02-01', '2024-02-15', NULL, NULL),
(8, 8, 8, '2024-02-05', '2024-02-20', NULL, NULL),
(9, 9, 9, '2024-02-10', '2024-02-25', NULL, NULL),
(10, 10, 10, '2024-02-15', '2024-03-01', NULL, NULL),
(11, 11, 11, '2024-02-20', '2024-03-05', NULL, NULL),
(12, 12, 12, '2024-02-25', '2024-03-10', NULL, NULL),
(13, 13, 13, '2024-03-01', '2024-03-15', NULL, NULL),
(14, 14, 14, '2024-03-05', '2024-03-20', NULL, NULL),
(15, 15, 15, '2024-03-10', '2024-03-25', NULL, NULL);
SET IDENTITY_INSERT Borrow OFF;
