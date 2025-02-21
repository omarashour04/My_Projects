CREATE VIEW TotalFinesByBranch AS
SELECT LibraryBranch.Name, SUM(Borrow.FineAmount) AS TotalFines
FROM LibraryBranch
JOIN Member ON LibraryBranch.BranchID = Member.BranchID
JOIN Borrow ON Member.MemberID = Borrow.MemberID
GROUP BY LibraryBranch.Name;