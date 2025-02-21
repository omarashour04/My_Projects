CREATE VIEW BorrowedBooksStatus AS
SELECT Book.Title, Borrow.BorrowDate, Borrow.DueDate, Borrow.ReturnDate
FROM Book
JOIN Borrow ON Book.BookID = Borrow.BookID
WHERE Borrow.ReturnDate IS NULL;