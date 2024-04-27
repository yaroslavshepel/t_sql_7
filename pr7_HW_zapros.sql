use pr7
go

/*1*/
SELECT [LectureRooms_HW].[Name]
FROM [LectureRooms_HW]
JOIN [Schedules_HW] ON [LectureRoomId] = [LectureRooms_HW].Id
JOIN [Lectures_HW] ON [Lectures_HW].Id = [Schedules_HW].[LectureId]
JOIN [Teachers_HW] ON [Teachers_HW].Id = [Lectures_HW].[TeacherId]
WHERE [Teachers_HW].[Name] = 'Edward' AND [Teachers_HW].[Surname] = 'Hopper';

/*2*/
SELECT [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Assistants_HW] ON [Assistants_HW].TeacherId = [Teachers_HW].Id
JOIN [Lectures_HW] ON [Lectures_HW].TeacherId = [Teachers_HW].Id
JOIN [GroupsLectures_HW] ON [GroupsLectures_HW].LectureId = [Lectures_HW].Id
JOIN [Groups_HW] ON [Groups_HW].Id = [GroupsLectures_HW].GroupId
WHERE [Groups_HW].[Name] = 'F505';


/*3*/
SELECT [Subjects_HW].[Name] AS [Subject]
FROM [Subjects_HW]
JOIN [Lectures_HW] ON [Lectures_HW].[SubjectId] = [Subjects_HW].Id
JOIN [Teachers_HW] ON [Teachers_HW].Id = [Lectures_HW].[TeacherId]
JOIN [GroupsLectures_HW] ON [GroupsLectures_HW].[LectureId] = [Lectures_HW].Id
JOIN [Groups_HW] ON [Groups_HW].Id = [GroupsLectures_HW].[GroupId]
WHERE [Teachers_HW].[Name] = 'Alex' AND [Teachers_HW].[Surname] = 'Carmack' AND [Groups_HW].[Year] = 5;

/*4*/
SELECT DISTINCT [Teachers_HW].[Surname]
FROM [Teachers_HW]
WHERE [Teachers_HW].Id NOT IN (
    SELECT DISTINCT [Lectures_HW].TeacherId
    FROM [Lectures_HW]
    JOIN [Schedules_HW] ON [Schedules_HW].[LectureId] = [Lectures_HW].Id
    WHERE [Schedules_HW].[DayOfWeek] = 1
);

/*5*/
SELECT DISTINCT [LectureRooms_HW].[Name], [LectureRooms_HW].[Building]
FROM [LectureRooms_HW]
WHERE [LectureRooms_HW].Id NOT IN (
    SELECT DISTINCT [Schedules_HW].LectureRoomId
    FROM [Schedules_HW]
    WHERE [Schedules_HW].[DayOfWeek] = 3 AND [Schedules_HW].[Week] = 2 AND [Schedules_HW].[Class] = 3
);

/*6*/
SELECT [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Faculties] ON [Faculties].[DeanId] = [Teachers_HW].Id
JOIN [Departments_HW] ON [Departments_HW].[FacultyId] = [Faculties].Id
WHERE [Faculties].[Name] = 'Computer Science' AND [Departments_HW].[Name] = 'Software Development'
AND [Faculties].Id NOT IN (
    SELECT [Curators_HW].TeacherId
    FROM [Curators_HW]
    JOIN [GroupsCurators_HW] ON [GroupsCurators_HW].[CuratorId] = [Curators_HW].Id
    JOIN [Groups_HW] ON [Groups_HW].Id = [GroupsCurators_HW].[GroupId]
    WHERE [Groups_HW].[DepartmentId] = [Departments_HW].Id
);

/*7*/
SELECT DISTINCT [Building]
FROM (
    SELECT [Building] FROM [Faculties]
    UNION ALL
    SELECT [Building] FROM [Departments_HW]
    UNION ALL
    SELECT [Building] FROM [LectureRooms_HW]
) AS [Buildings];

/*8*/
SELECT 'Dean' AS [Role], [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Faculties] ON [Faculties].[DeanId] = [Teachers_HW].Id
UNION ALL
SELECT 'Head', [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Departments_HW] ON [Departments_HW].[HeadId] = [Teachers_HW].Id
UNION ALL
SELECT 'Lecturer', [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Lectures_HW] ON [Lectures_HW].[TeacherId] = [Teachers_HW].Id
UNION ALL
SELECT 'Curator', [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Curators_HW] ON [Curators_HW].[TeacherId] = [Teachers_HW].Id
UNION ALL
SELECT 'Assistant', [Teachers_HW].[Name], [Teachers_HW].[Surname]
FROM [Teachers_HW]
JOIN [Assistants_HW] ON [Assistants_HW].[TeacherId] = [Teachers_HW].Id
ORDER BY [Role];

/*9*/
SELECT DISTINCT [Schedules_HW].[DayOfWeek]
FROM [Schedules_HW]
JOIN [LectureRooms_HW] ON [LectureRooms_HW].Id = [Schedules_HW].LectureRoomId
WHERE ([LectureRooms_HW].Name = 'A311' OR [LectureRooms_HW].Name = 'A104');
