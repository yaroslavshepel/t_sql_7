use pr7 
go
INSERT INTO [Teachers_HW] ([Name], [Surname])
VALUES 
('John', 'Smith'),
('Anna', 'Johnson'),
('Peter', 'Brown'),
('Lucy', 'Williams'),
('Tom', 'Jones'),
('Sara', 'Davis'),
('Mike', 'Miller'),
('Sophia', 'Garcia'),
('Chris', 'Rodriguez'),
('Emma', 'Martinez'),
('James', 'Hernandez'),
('Olivia', 'Lopez'),
('Jacob', 'Gonzalez'),
('Liam', 'Wilson'),
('Ava', 'Anderson');

INSERT INTO [Assistants_HW] ([TeacherId])
VALUES
(1), 
(2), 
(3), 
(4), 
(5), 
(6), 
(7), 
(8), 
(9), 
(10), 
(11), 
(12), 
(13), 
(14), 
(15);

INSERT INTO [Curators_HW] ([TeacherId])
VALUES 
(1), 
(2), 
(3), 
(4), 
(5), 
(6), 
(7), 
(8), 
(9), 
(10), 
(11), 
(12), 
(13), 
(14), 
(15);

INSERT INTO [Deans_HW] ([TeacherId])
VALUES
(1), 
(2), 
(3), 
(4), 
(5), 
(6), 
(7), 
(8), 
(9), 
(10), 
(11), 
(12), 
(13), 
(14), 
(15);

INSERT INTO [Faculties] ([Building], [Name], [DeanId])
VALUES 
(1, 'Science', 1),
(2, 'Arts', 2),
(3, 'Engineering', 3),
(4, 'Business', 4),
(5, 'Medicine', 5),
(1, 'Law', 6),
(2, 'Education', 7),
(3, 'Social Sciences', 8),
(4, 'Humanities', 9),
(5, 'Mathematics', 10),
(1, 'Physics', 11),
(2, 'Chemistry', 12),
(3, 'Biology', 13),
(4, 'Computer Science', 14),
(5, 'Economics', 15);

INSERT INTO [Departments_HW] ([Building], [Name], [FacultyId], [HeadId])
VALUES
(1, 'Physics', 1, 1),
(2, 'Chemistry', 2, 2),
(3, 'Biology', 3, 3),
(4, 'Computer Science', 4, 4),
(5, 'Economics', 5, 5),
(1, 'Mathematics', 6, 6),
(2, 'Social Sciences', 7, 7),
(3, 'Humanities', 8, 8),
(4, 'Education', 9, 9),
(5, 'Business', 10, 10),
(1, 'Engineering', 11, 11),
(2, 'Arts', 12, 12),
(3, 'Medicine', 13, 13),
(4, 'Law', 14, 14),
(5, 'Science', 15, 15);

INSERT INTO [Groups_HW] ([Name], [Year], [DepartmentId])
VALUES
('Group A', 1, 1),
('Group B', 2, 2),
('Group C', 3, 3),
('Group D', 4, 4),
('Group E', 5, 5),
('Group F', 1, 6),
('Group G', 2, 7),
('Group H', 3, 8),
('Group I', 4, 9),
('Group J', 5, 10),
('Group K', 1, 11),
('Group L', 2, 12),
('Group M', 3, 13),
('Group N', 4, 14),
('Group O', 5, 15);

INSERT INTO [GroupsCurators_HW] ([CuratorId], [GroupId])
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO [Heads_HW] ([TeacherId])
VALUES
(1), 
(2), 
(3), 
(4), 
(5), 
(6), 
(7), 
(8), 
(9), 
(10), 
(11), 
(12), 
(13), 
(14), 
(15);

INSERT INTO [LectureRooms_HW] ([Building], [Name])
VALUES 
(1, 'Room A'),
(2, 'Room B'),
(3, 'Room C'),
(4, 'Room D'),
(5, 'Room E'),
(1, 'Room F'),
(2, 'Room G'),
(3, 'Room H'),
(4, 'Room I'),
(5, 'Room J'),
(1, 'Room K'),
(2, 'Room L'),
(3, 'Room M'),
(4, 'Room N'),
(5, 'Room O');

INSERT INTO [Subjects_HW] ([Name])
VALUES 
('Math'), 
('Physics'), 
('Chemistry'), 
('Biology'), 
('Computer Science'),
('Economics'), 
('Business'), 
('Arts'), 
('Medicine'), 
('Engineering'), 
('Law'), 
('Education'), 
('Humanities'), 
('Social Sciences'), 
('Science');

INSERT INTO [Lectures_HW] ([SubjectId], [TeacherId])
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO [GroupsLectures_HW] ([GroupId], [LectureId])
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10), 
(11, 11), 
(12, 12), 
(13, 13), 
(14, 14), 
(15, 15);

INSERT INTO [Schedules_HW] ([Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId])
VALUES 
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 6),
(7, 7, 7, 7, 7),
(8, 1, 1, 8, 8),
(1, 2, 2, 9, 9),
(2, 3, 3, 10, 10),
(3, 4, 4, 11, 11),
(4, 5, 5, 12, 12),
(5, 6, 6, 13, 13),
(6, 7, 7, 14, 14),
(7, 1, 1, 15, 15);
