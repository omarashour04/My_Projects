
-- Report 1: Total Number of Books by Genre
-- Relational Algebra: π GenreName, COUNT(BookID) (Genre ⋈ Book.GenreID = Genre.GenreID)
SELECT Genre.GenreName, COUNT(Book.BookID) AS TotalBooks
FROM Genre
JOIN Book ON Genre.GenreID = Book.GenreID
GROUP BY Genre.GenreName
ORDER BY TotalBooks DESC;

-- Report 2: Members with Borrowed Books
-- Relational Algebra: π Name, Email, COUNT(BorrowID) (Member ⋈ Borrow.MemberID = Member.MemberID) GROUP BY Name, Email HAVING COUNT(BorrowID) > 0
SELECT Member.Name, Member.Email, COUNT(Borrow.BorrowID) AS BorrowedBooks
FROM Member
JOIN Borrow ON Member.MemberID = Borrow.MemberID
GROUP BY Member.Name, Member.Email
HAVING COUNT(Borrow.BorrowID) > 0;

-- Report 3: Books Borrowed and Their Return Status
-- Relational Algebra: π Title, BorrowDate, DueDate, ReturnDate (Book ⋈ Borrow.BookID = Book.BookID) σ ReturnDate IS NULL
SELECT Book.Title, Borrow.BorrowDate, Borrow.DueDate, Borrow.ReturnDate
FROM Book
JOIN Borrow ON Book.BookID = Borrow.BookID
WHERE Borrow.ReturnDate IS NULL;

-- Report 4: List of Books Available for Borrowing
-- Relational Algebra: π Title, Author, Stock (σ Stock > 0 (Book))
SELECT Title, Author, Stock
FROM Book
WHERE Stock > 0;

-- Report 5: Total Fines Collected by Branch
-- Relational Algebra: π Name, SUM(FineAmount) (LibraryBranch ⋈ Member.BranchID = LibraryBranch.BranchID ⋈ Borrow.MemberID = Member.MemberID) GROUP BY Name
SELECT LibraryBranch.Name, SUM(Borrow.FineAmount) AS TotalFines
FROM LibraryBranch
JOIN Member ON LibraryBranch.BranchID = Member.BranchID
JOIN Borrow ON Member.MemberID = Borrow.MemberID
GROUP BY LibraryBranch.Name;

-- Report 6: Members Who Have Not Borrowed Any Books
-- Relational Algebra: π Name, Email (Member) − π MemberID (Borrow)
SELECT Name, Email
FROM Member
WHERE MemberID NOT IN (SELECT MemberID FROM Borrow);

-- Report 7: Books Borrowed by Genre
-- Relational Algebra: π GenreName, COUNT(BorrowID) (Genre ⋈ Book.GenreID = Genre.GenreID ⋈ Borrow.BookID = Book.BookID) GROUP BY GenreName
SELECT Genre.GenreName, COUNT(Borrow.BorrowID) AS BorrowedBooks
FROM Genre
JOIN Book ON Genre.GenreID = Book.GenreID
JOIN Borrow ON Book.BookID = Borrow.BookID
GROUP BY Genre.GenreName;

-- Report 8: Overdue Books
-- Relational Algebra: π Title, BorrowDate, DueDate, OverdueDays (Book ⋈ Borrow.BookID = Book.BookID) σ DueDate < TODAY AND ReturnDate IS NULL
SELECT Book.Title, Borrow.BorrowDate, Borrow.DueDate, DATEDIFF(DAY, Borrow.DueDate, GETDATE()) AS OverdueDays
FROM Book
JOIN Borrow ON Book.BookID = Borrow.BookID
WHERE Borrow.DueDate < GETDATE() AND Borrow.ReturnDate IS NULL;