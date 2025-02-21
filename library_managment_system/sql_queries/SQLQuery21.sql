CREATE PROCEDURE ReturnBook
    @BookID INT,
    @MemberID INT,
    @ReturnDate DATE
AS
BEGIN
    DECLARE @DueDate DATE, @FineAmount INT;

    -- Fetch the due date
    SELECT @DueDate = DueDate
    FROM Borrow
    WHERE BookID = @BookID AND MemberID = @MemberID AND ReturnDate IS NULL;

    -- Check if the return is late
    IF @ReturnDate > @DueDate
    BEGIN
        SET @FineAmount = 50; -- Fixed fine amount
    END
    ELSE
    BEGIN
        SET @FineAmount = 0;
    END;

    -- Update the borrow record
    UPDATE Borrow
    SET ReturnDate = @ReturnDate, FineAmount = @FineAmount
    WHERE BookID = @BookID AND MemberID = @MemberID AND ReturnDate IS NULL;

    -- Update the stock of the book
    UPDATE Book
    SET Stock = Stock + 1
    WHERE BookID = @BookID;
END;
GO
