CREATE VIEW MembersWithoutBorrowedBooks AS
SELECT Name, Email
FROM Member
WHERE MemberID NOT IN (SELECT MemberID FROM Borrow);