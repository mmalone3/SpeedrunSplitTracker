-- =========================================================================
-- Speedrun Split Tracker & Telemetry Database Schema & Stored Procedures
-- Database: SpeedrunDB
-- =========================================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SpeedrunDB')
BEGIN
    CREATE DATABASE SpeedrunDB;
END
GO

USE SpeedrunDB;
GO

-- Clean up existing tables if recreating
IF OBJECT_ID(N'dbo.StarSplits', N'U') IS NOT NULL DROP TABLE dbo.StarSplits;
IF OBJECT_ID(N'dbo.Stars', N'U') IS NOT NULL DROP TABLE dbo.Stars;
IF OBJECT_ID(N'dbo.Levels', N'U') IS NOT NULL DROP TABLE dbo.Levels;
IF OBJECT_ID(N'dbo.Runners', N'U') IS NOT NULL DROP TABLE dbo.Runners;
GO

-- 1. Levels Table (Courses)
CREATE TABLE dbo.Levels (
    LevelID INT IDENTITY(1,1) PRIMARY KEY,
    LevelName NVARCHAR(100) NOT NULL,
    CourseNumber INT NOT NULL
);
GO

-- 2. Stars Table (Star Missions)
CREATE TABLE dbo.Stars (
    StarID INT IDENTITY(1,1) PRIMARY KEY,
    LevelID INT NOT NULL FOREIGN KEY REFERENCES dbo.Levels(LevelID),
    StarNumber INT NOT NULL,
    StarName NVARCHAR(100) NOT NULL
);
GO

-- 3. Runners Table
CREATE TABLE dbo.Runners (
    RunnerID INT IDENTITY(1,1) PRIMARY KEY,
    RunnerTag NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- 4. Star Splits Table
CREATE TABLE dbo.StarSplits (
    SplitID INT IDENTITY(1,1) PRIMARY KEY,
    RunnerID INT NOT NULL FOREIGN KEY REFERENCES dbo.Runners(RunnerID),
    StarID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stars(StarID),
    Category NVARCHAR(50) NOT NULL, -- '16 Star', '70 Star', '120 Star'
    BestTimeSeconds DECIMAL(7, 2) NOT NULL,
    LastUpdated DATETIME2 DEFAULT SYSUTCDATETIME()
);
GO

-- 5. Stored Procedure: Get Category Leaderboard Summary
CREATE OR ALTER PROCEDURE dbo.sp_GetCategoryLeaderboard
    @Category NVARCHAR(50) = '70 Star'
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        r.RunnerTag,
        s.Category,
        COUNT(s.StarID) AS StarsCompleted,
        ISNULL(SUM(s.BestTimeSeconds), 0.00) AS TotalRunTimeSeconds,
        ISNULL(MIN(s.BestTimeSeconds), 0.00) AS FastestStarSeconds
    FROM dbo.StarSplits s
    INNER JOIN dbo.Runners r ON s.RunnerID = r.RunnerID
    WHERE s.Category = @Category
    GROUP BY r.RunnerTag, s.Category
    ORDER BY TotalRunTimeSeconds ASC;
END;
GO

-- 6. Stored Procedure: Get Runner Splits Breakdown
CREATE OR ALTER PROCEDURE dbo.sp_GetRunnerSplits
    @RunnerTag NVARCHAR(50),
    @Category NVARCHAR(50) = '70 Star'
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        l.LevelName,
        l.CourseNumber,
        st.StarNumber,
        st.StarName,
        sp.Category,
        sp.BestTimeSeconds,
        sp.LastUpdated
    FROM dbo.StarSplits sp
    INNER JOIN dbo.Runners r ON sp.RunnerID = r.RunnerID
    INNER JOIN dbo.Stars st ON sp.StarID = st.StarID
    INNER JOIN dbo.Levels l ON st.LevelID = l.LevelID
    WHERE r.RunnerTag = @RunnerTag AND sp.Category = @Category
    ORDER BY l.CourseNumber ASC, st.StarNumber ASC;
END;
GO

-- 7. Stored Procedure: Upsert / Record New Star Split Time
CREATE OR ALTER PROCEDURE dbo.sp_UpsertStarTime
    @RunnerTag NVARCHAR(50),
    @StarName NVARCHAR(100),
    @Category NVARCHAR(50),
    @TimeSeconds DECIMAL(7, 2)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @RunnerID INT;
    SELECT @RunnerID = RunnerID FROM dbo.Runners WHERE RunnerTag = @RunnerTag;
    IF @RunnerID IS NULL
    BEGIN
        INSERT INTO dbo.Runners (RunnerTag) VALUES (@RunnerTag);
        SET @RunnerID = SCOPE_IDENTITY();
    END

    DECLARE @StarID INT;
    SELECT @StarID = StarID FROM dbo.Stars WHERE StarName = @StarName;

    IF @StarID IS NOT NULL
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.StarSplits WHERE RunnerID = @RunnerID AND StarID = @StarID AND Category = @Category)
        BEGIN
            UPDATE dbo.StarSplits
            SET BestTimeSeconds = @TimeSeconds,
                LastUpdated = SYSUTCDATETIME()
            WHERE RunnerID = @RunnerID AND StarID = @StarID AND Category = @Category;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.StarSplits (RunnerID, StarID, Category, BestTimeSeconds)
            VALUES (@RunnerID, @StarID, @Category, @TimeSeconds);
        END
    END
END;
GO

-- Seed Courses and Stars
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES
('Bob-omb Battlefield', 1),
('Whomp''s Fortress', 2),
('Jolly Roger Bay', 3),
('Cool, Cool Mountain', 4);

INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES
(1, 1, 'Big Bob-omb on the Summit'),
(1, 2, 'Footrace with Koopa the Quick'),
(1, 3, 'Shoot to the Island in the Sky'),
(2, 1, 'Chip Off Whomp''s Block'),
(2, 2, 'To the Top of the Fortress'),
(3, 1, 'Plunder in the Sunken Ship'),
(4, 1, 'Slip Slidin'' Away');

-- Initial Seed Data
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Big Bob-omb on the Summit', '70 Star', 0.49;
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Footrace with Koopa the Quick', '70 Star', 0.58;
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Chip Off Whomp''s Block', '70 Star', 0.42;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Big Bob-omb on the Summit', '70 Star', 0.45;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Footrace with Koopa the Quick', '70 Star', 0.51;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Chip Off Whomp''s Block', '70 Star', 0.39;
GO
