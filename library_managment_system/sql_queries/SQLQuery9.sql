CREATE VIEW BooksBorrowedByGenre AS
SELECT Genre.GenreName, COUNT(Borrow.BorrowID) AS BorrowedBooks
FROM Genre
JOIN Book ON Genre.GenreID = Book.GenreID
JOIN Borrow ON Book.BookID = Borrow.BookID
GROUP BY Genre.GenreName;