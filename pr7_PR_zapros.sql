use pr7
go

/*1*/
SELECT [Name], [Places]
FROM [Wards_PR]
WHERE [DepartmentId] IN (SELECT Id FROM [Departments_PR] WHERE [Building] = 5)
AND [Places] >= 5
AND [DepartmentId] IN (SELECT Id FROM [Wards_PR] WHERE [Places] > 15);

/*2*/
SELECT DISTINCT d.[Name]
FROM [Departments_PR] d
INNER JOIN [DoctorsExaminations_PR] de ON d.Id = de.[DepartmentId]
WHERE de.[Date] >= DATEADD(WEEK, -1, GETDATE());

/*3*/
SELECT [Name]
FROM [Diseases_PR]
WHERE Id NOT IN (SELECT DISTINCT [DiseaseId] FROM [DoctorsExaminations_PR]);

/*4*/
SELECT CONCAT([Name], ' ', [Surname]) AS [FullName]
FROM [Doctors_PR]
WHERE Id NOT IN (SELECT DISTINCT [DoctorId] FROM [DoctorsExaminations_PR]);

/*5*/
SELECT [Name]
FROM [Departments_PR]
WHERE Id NOT IN (SELECT DISTINCT [DepartmentId] FROM [Wards_PR]);

/*6*/
SELECT [Surname]
FROM [Doctors_PR]
WHERE Id IN (SELECT [DoctorId] FROM [Inters_PR]);

/*7*/
SELECT d.[Surname]
FROM [Doctors_PR] d
JOIN [Inters_PR] i ON d.Id = i.[DoctorId]
WHERE d.[Salary] > (SELECT MIN([Salary]) FROM [Doctors_PR]);

/*8*/
SELECT [Name]
FROM [Wards_PR]
WHERE [Places] > ALL (SELECT [Places] FROM [Wards_PR] WHERE [DepartmentId] IN (SELECT Id FROM [Departments_PR] WHERE [Building] = 3));

/*9*/
SELECT DISTINCT d.[Surname]
FROM [Doctors_PR] d
JOIN [DoctorsExaminations_PR] de ON d.Id = de.[DoctorId]
JOIN [Departments_PR] dp ON dp.Id = de.[DepartmentId]
WHERE dp.[Name] IN ('Ophthalmology', 'Physiotherapy');

/*10*/
SELECT [Name]
FROM [Inters_PR], [Professors_PR]
WHERE Id IN (
    SELECT [DepartmentId]
    FROM (SELECT [DoctorId], COUNT([DoctorId]) AS [DoctorsCount] FROM [Inters_PR] GROUP BY [DoctorId]) AS [IntersCount]
    JOIN (SELECT [DoctorId], COUNT([DoctorId]) AS [DoctorsCount] FROM [Professors_PR] GROUP BY [DoctorId]) AS [ProfessorsCount]
    ON IntersCount.[DoctorId] = ProfessorsCount.[DoctorId]
    WHERE IntersCount.[DoctorsCount] > 0 AND ProfessorsCount.[DoctorsCount] > 0
);

/*11*/
SELECT CONCAT(D.[Name], ' ', D.[Surname]) AS [DoctorName], Dep.[Name] AS [DepartmentName]
FROM [DoctorsExaminations_PR] DE
JOIN [Doctors_PR] D ON DE.[DoctorId] = D.Id
JOIN [Departments_PR] Dep ON DE.[WardId] = Dep.Id
WHERE Dep.[Financing] > 20000;

/*12*/
SELECT TOP 1 Dep.[Name]
FROM [DoctorsExaminations_PR] DE
JOIN [Doctors_PR] D ON DE.[DoctorId] = D.Id
JOIN [Departments_PR] Dep ON DE.[WardId] = Dep.Id
ORDER BY D.[Salary] DESC;
