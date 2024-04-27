CREATE TABLE [Teachers_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Assistants_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY ([TeacherId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [Curators_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY ([TeacherId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [Deans_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY ([TeacherId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [Faculties] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) UNIQUE NOT NULL,
    [DeanId] INT NOT NULL,
    FOREIGN KEY ([DeanId]) REFERENCES [Deans_HW](Id)
);

CREATE TABLE [Departments_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Building] INT NOT NULL CHECK ([Building] BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) UNIQUE NOT NULL,
    [FacultyId] INT NOT NULL,
    [HeadId] INT NOT NULL,
    FOREIGN KEY ([FacultyId]) REFERENCES [Faculties](Id),
    FOREIGN KEY ([HeadId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [Groups_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(10) UNIQUE NOT NULL,
    [Year] INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY ([DepartmentId]) REFERENCES [Departments_HW](Id)
);

CREATE TABLE [GroupsCurators_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [CuratorId] INT NOT NULL,
    [GroupId] INT NOT NULL,
    FOREIGN KEY ([CuratorId]) REFERENCES [Curators_HW](Id),
    FOREIGN KEY ([GroupId]) REFERENCES [Groups_HW](Id)
);

CREATE TABLE [Heads_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY ([TeacherId]) REFERENCES [Teachers_HW](Id)
);

CREATE TABLE [LectureRooms_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Building] INT NOT NULL CHECK ([Building] BETWEEN 1 AND 5),
    [Name] NVARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE [Subjects_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE [Lectures_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [SubjectId] INT NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (SubjectId) REFERENCES [Subjects_HW](Id),
    FOREIGN KEY (TeacherId) REFERENCES [Teachers_HW](Id)
);


CREATE TABLE [GroupsLectures_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [GroupId] INT NOT NULL,
    [LectureId] INT NOT NULL,
    FOREIGN KEY ([GroupId]) REFERENCES [Groups_HW](Id),
    FOREIGN KEY ([LectureId]) REFERENCES [Lectures_HW](Id)
);


CREATE TABLE [Schedules_HW] (
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Class] INT NOT NULL CHECK ([Class] BETWEEN 1 AND 8),
    [DayOfWeek] INT NOT NULL CHECK ([DayOfWeek] BETWEEN 1 AND 7),
    [Week] INT NOT NULL CHECK ([Week] BETWEEN 1 AND 52),
    [LectureId] INT NOT NULL,
    [LectureRoomId] INT NOT NULL,
    FOREIGN KEY ([LectureId]) REFERENCES [Lectures_HW](Id),
    FOREIGN KEY ([LectureRoomId]) REFERENCES [LectureRooms_HW](Id)
);
