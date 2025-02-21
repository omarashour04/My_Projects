CREATE VIEW MembersWithBorrowedBooks AS
SELECT Member.Name, Member.Email, COUNT(Borrow.BorrowID) AS BorrowedBooks
FROM Member
JOIN Borrow ON Member.MemberID = Borrow.MemberID
GROUP BY Member.Name, Member.Email
HAVING COUNT(Borrow.BorrowID) > 0;