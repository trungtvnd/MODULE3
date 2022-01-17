SELECT  s.SubID, s.SubName, s.Credit
FROM Subject s
WHERE s.Credit = (SELECT MAX(Credit) From Subject);

SELECt s.SubName, m.Mark
FROM Subject s
INNER JOIN Mark m ON m.SubID = s.SubID
GROUP BY s.SubName
HAVING m.mark >=  ALL (SELECT MAX(m.Mark) From Mark GROUP BY mark)
Limit 1;



SELECT s.StudentID, s.StudentName, AVG(mark)
FROM Student s
INNER JOIN Mark m On m.StudentID = s.StudentID
GROUP BY s.StudentName
ORDER BY  AVG(mark) DESC;



