CREATE TABLE [Departments_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Financing] MONEY NOT NULL DEFAULT 0 CHECK ([Financing] >= 0),
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE [Diseases_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE [Doctors_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Salary] MONEY NOT NULL CHECK ([Salary] > 0),
    [Surname] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [Examinations_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE [Inters_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [DoctorId] INT NOT NULL,
    FOREIGN KEY ([DoctorId]) REFERENCES [Doctors_PR](Id)
);

CREATE TABLE [Professors_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [DoctorId] INT NOT NULL,
    FOREIGN KEY ([DoctorId]) REFERENCES [Doctors_PR](Id)
);

CREATE TABLE [Wards_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(20) NOT NULL UNIQUE,
    [Places] INT NOT NULL CHECK ([Places] >= 1),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY ([DepartmentId]) REFERENCES [Departments_PR](Id)
);

CREATE TABLE [DoctorsExaminations_PR] (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Date] DATE NOT NULL DEFAULT GETDATE() CHECK ([Date] <= GETDATE()),
    [DiseaseId] INT NOT NULL,
    [DoctorId] INT NOT NULL,
    [ExaminationId] INT NOT NULL,
    [WardId] INT NOT NULL,
    FOREIGN KEY ([DiseaseId]) REFERENCES [Diseases_PR](Id),
    FOREIGN KEY ([DoctorId]) REFERENCES [Doctors_PR](Id),
    FOREIGN KEY ([ExaminationId]) REFERENCES [Examinations_PR](Id),
    FOREIGN KEY ([WardId]) REFERENCES [Wards_PR](Id)
);