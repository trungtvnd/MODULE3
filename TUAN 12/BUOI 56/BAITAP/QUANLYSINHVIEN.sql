SELECT ST.StudentName
FROM STUDENT st
WHERE ST.StudentName LIKE 'H%' ;

SELECT cl.StartDate
FROM Class cl
WHERE Month(cl.StartDate) = 12;

SELECT s.Credit
FROM Subject s
WHERE s.Credit BETWEEN 3 and 5;

SET SQL_SAFE_UPDATES = 0;
UPDATE Student Set ClassID  =  12
WHERE StudentName = 'Hung';
SET SQL_SAFE_UPDATES = 1;


INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES 
       (3, 2, 10, 2),
       (2, 3, 12, 1);

SELECT st.StudentName, s.SubName, m.Mark
FROM Student st 
INNER JOIN mark m ON st.StudentID = m.StudentID
INNER JOIN Subject s ON s.SubID = m.SubID

ORDER BY m.Mark DESC, st.StudentName ASC;







