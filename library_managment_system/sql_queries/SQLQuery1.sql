-- Create Library Management System Database
CREATE DATABASE LibraryManagementSystem;
GO

USE LibraryManagementSystem;
GO

-- Genre Table
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName NVARCHAR(100) NOT NULL
);

-- Shelf Table
CREATE TABLE Shelf (
    ShelfID INT PRIMARY KEY IDENTITY(1,1),
    Location NVARCHAR(100) NOT NULL,
    GenreID INT NOT NULL,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

-- Library Branch Table
CREATE TABLE LibraryBranch (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200),
    Phone NVARCHAR(15)
);

-- Member Table
CREATE TABLE Member (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15) NOT NULL,
    MembershipDate DATE NOT NULL DEFAULT GETDATE(),
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES LibraryBranch(BranchID)
);

-- Book Table
CREATE TABLE Book (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Author NVARCHAR(150) NOT NULL,
    ISBN NVARCHAR(20) UNIQUE NOT NULL,
    GenreID INT NOT NULL,
    ShelfID INT NOT NULL,
    PublicationYear INT CHECK (PublicationYear >= 1000 AND PublicationYear <= YEAR(GETDATE())),
    Stock INT CHECK (Stock >= 0),
    Status NVARCHAR(50) DEFAULT 'Available',
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    FOREIGN KEY (ShelfID) REFERENCES Shelf(ShelfID)
);

-- Librarian Table
CREATE TABLE Librarian (
    LibrarianID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15),
    HireDate DATE NOT NULL DEFAULT GETDATE(),
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES LibraryBranch(BranchID)
);

-- Borrow Table
CREATE TABLE Borrow (
    BorrowID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BorrowDate DATE NOT NULL DEFAULT GETDATE(),
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FineAmount DECIMAL(10, 2) CHECK (FineAmount >= 0),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATE NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- Transaction Table
CREATE TABLE [Transaction] (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    BorrowID INT NOT NULL,
    PaymentDate DATE NOT NULL DEFAULT GETDATE(),
    AmountPaid DECIMAL(10, 2) NOT NULL CHECK (AmountPaid >= 0),
    FOREIGN KEY (BorrowID) REFERENCES Borrow(BorrowID)
);
