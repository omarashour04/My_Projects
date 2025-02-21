CREATE PROCEDURE AddBook
    @Title NVARCHAR(200),
    @Author NVARCHAR(150),
    @ISBN NVARCHAR(20),
    @GenreID INT,
    @ShelfID INT,
    @PublicationYear INT,
    @Stock INT,
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Book (Title, Author, ISBN, GenreID, ShelfID, PublicationYear, Stock, Status)
    VALUES (@Title, @Author, @ISBN, @GenreID, @ShelfID, @PublicationYear, @Stock, @Status);
END;
GO
