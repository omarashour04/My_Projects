CREATE PROCEDURE BorrowBook
    @BookID INT,
    @MemberID INT,
    @BorrowDate DATE,
    @DueDate DATE
AS
BEGIN
    -- Check if the book is available
    IF EXISTS (SELECT 1 FROM Book WHERE BookID = @BookID AND Stock > 0)
    BEGIN
        INSERT INTO Borrow (BookID, MemberID, BorrowDate, DueDate, ReturnDate, FineAmount)
        VALUES (@BookID, @MemberID, @BorrowDate, @DueDate, NULL, 0);

        -- Update the stock of the book
        UPDATE Book
        SET Stock = Stock - 1
        WHERE BookID = @BookID;
    END
    ELSE
    BEGIN
        PRINT 'Book is not available for borrowing.';
    END;
END;
GO
