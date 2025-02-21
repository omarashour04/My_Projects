use LibraryManagementSystem
ALTER TABLE Borrow
DROP CONSTRAINT BookID; -- Replace with your actual foreign key name if different
ALTER TABLE Borrow
ADD CONSTRAINT BookID FOREIGN KEY (BookID)
REFERENCES Book(BookID) ON DELETE CASCADE;

ALTER TABLE Borrow
DROP CONSTRAINT MemberID; -- Replace with your actual foreign key name if different
ALTER TABLE Borrow
ADD CONSTRAINT MemberID FOREIGN KEY (MemberID)
REFERENCES Member(MemberID) ON DELETE CASCADE;

ALTER TABLE Shelf
DROP CONSTRAINT GenreID; -- Replace with your actual foreign key name if different
ALTER TABLE Shelf
ADD CONSTRAINT GenreID FOREIGN KEY (GenreID)
REFERENCES Genre(GenreID) ON DELETE CASCADE;

ALTER TABLE Book
DROP CONSTRAINT GenreID; -- Replace with your actual foreign key name if different
ALTER TABLE Book
ADD CONSTRAINT GenreID FOREIGN KEY (GenreID)
REFERENCES Genre(GenreID) ON DELETE CASCADE;

ALTER TABLE Book
DROP CONSTRAINT ShelfID; -- Replace with your actual foreign key name if different
ALTER TABLE Book
ADD CONSTRAINT ShelfID FOREIGN KEY (ShelfID)
REFERENCES Shelf(ShelfID) ON DELETE CASCADE;

ALTER TABLE Member
DROP CONSTRAINT BranchID; -- Replace with your actual foreign key name if different
ALTER TABLE Member
ADD CONSTRAINT BranchID FOREIGN KEY (BranchID)
REFERENCES Librarybranch(BranchID) ON DELETE CASCADE;


ALTER TABLE Librarian
DROP CONSTRAINT BranchID; -- Replace with your actual foreign key name if different
ALTER TABLE Librarian
ADD CONSTRAINT BranchID FOREIGN KEY (BranchID)
REFERENCES Librarybranch(BranchID) ON DELETE CASCADE;

ALTER TABLE Reservation
DROP CONSTRAINT MemberID; -- Replace with your actual foreign key name if different
ALTER TABLE Reservation
ADD CONSTRAINT MemberID FOREIGN KEY (MemberID)
REFERENCES Member(MemberID) ON DELETE CASCADE;

ALTER TABLE Reservation
DROP CONSTRAINT BookID; -- Replace with your actual foreign key name if different
ALTER TABLE Reservation
ADD CONSTRAINT BookID FOREIGN KEY (BookID)
REFERENCES Book(BookID) ON DELETE CASCADE;



