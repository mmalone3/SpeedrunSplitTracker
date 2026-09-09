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

-- Seed All 15 Main Courses + Peach's Castle Secrets
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES
('Bob-omb Battlefield', 1),
('Whomp''s Fortress', 2),
('Jolly Roger Bay', 3),
('Cool, Cool Mountain', 4),
('Big Boo''s Haunt', 5),
('Hazy Maze Cave', 6),
('Lethal Lava Land', 7),
('Shifting Sand Land', 8),
('Dire, Dire Docks', 9),
('Snowman''s Land', 10),
('Wet-Dry World', 11),
('Tall, Tall Mountain', 12),
('Tiny-Huge Island', 13),
('Tick Tock Clock', 14),
('Rainbow Ride', 15),
('Peach''s Castle Secrets', 16);

-- Seed All 120 Stars
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES
-- Course 1: Bob-omb Battlefield
(1, 1, 'Big Bob-omb on the Summit'),
(1, 2, 'Footrace with Koopa the Quick'),
(1, 3, 'Shoot to the Island in the Sky'),
(1, 4, 'Find the 8 Red Coins'),
(1, 5, 'Mario Wings to the Sky'),
(1, 6, 'Behind Chain Chomp’s Gate'),
(1, 7, 'Bob-omb Battlefield 100 Coins'),

-- Course 2: Whomp's Fortress
(2, 1, 'Chip off Whomp’s Block'),
(2, 2, 'To the Top of the Fortress'),
(2, 3, 'Shoot into the Wild Blue'),
(2, 4, 'Red Coins on the Floating Isle'),
(2, 5, 'Fall onto the Caged Island'),
(2, 6, 'Blast Away the Wall'),
(2, 7, 'Whomp’s Fortress 100 Coins'),

-- Course 3: Jolly Roger Bay
(3, 1, 'Plunder in the Sunken Ship'),
(3, 2, 'Can the Eel Come out and Play?'),
(3, 3, 'Treasure of the Ocean Cave'),
(3, 4, 'Red Coins on the Ship Afloat'),
(3, 5, 'Blast to the Stone Pillar'),
(3, 6, 'Through the Jet Stream (JRB)'),
(3, 7, 'Jolly Roger Bay 100 Coins'),

-- Course 4: Cool, Cool Mountain
(4, 1, 'Slip Slidin’ Away'),
(4, 2, 'Li’l Penguin Lost'),
(4, 3, 'Big Penguin Race'),
(4, 4, 'Frosty Slide for 8 Red Coins'),
(4, 5, 'Snowman’s Lost his Head'),
(4, 6, 'Wall Kicks will Work'),
(4, 7, 'Cool, Cool Mountain 100 Coins'),

-- Course 5: Big Boo's Haunt
(5, 1, 'Go on a Ghost Hunt'),
(5, 2, 'Ride Big Boo’s Merry-Go-Round'),
(5, 3, 'Secret of the Haunted Books'),
(5, 4, 'Seek the 8 Red Coins'),
(5, 5, 'Big Boo’s Balcony'),
(5, 6, 'Eye to Eye in the Secret Room'),
(5, 7, 'Big Boo’s Haunt 100 Coins'),

-- Course 6: Hazy Maze Cave
(6, 1, 'Swimming Beast in the Cavern'),
(6, 2, 'Elevate for 8 Red Coins'),
(6, 3, 'Metal-Head Mario Can Move!'),
(6, 4, 'Navigating the Toxic Maze'),
(6, 5, 'A-Maze-ing Emergency Exit'),
(6, 6, 'Watch for the Rolling Rocks'),
(6, 7, 'Hazy Maze Cave 100 Coins'),

-- Course 7: Lethal Lava Land
(7, 1, 'Boil the Big Bully'),
(7, 2, 'Bully the Bullies'),
(7, 3, '8-Coin Puzzle with 15 Pieces'),
(7, 4, 'Red-Hot Log Rolling'),
(7, 5, 'Hot-Foot-It into the Volcano'),
(7, 6, 'Elevator Tour in the Volcano'),
(7, 7, 'Lethal Lava Land 100 Coins'),

-- Course 8: Shifting Sand Land
(8, 1, 'In the Talons of the Big Bird'),
(8, 2, 'Shining Atop the Pyramid'),
(8, 3, 'Inside the Ancient Pyramid'),
(8, 4, 'Stand Tall on the Four Pillars'),
(8, 5, 'Free Flying for 8 Red Coins'),
(8, 6, 'Pyramid Puzzle'),
(8, 7, 'Shifting Sand Land 100 Coins'),

-- Course 9: Dire, Dire Docks
(9, 1, 'Board Bowser’s Sub'),
(9, 2, 'Chests in the Current'),
(9, 3, 'Pole-Jumping for Red Coins'),
(9, 4, 'Through the Jet Stream (DDD)'),
(9, 5, 'The Manta Ray’s Reward'),
(9, 6, 'Collect the Caps'),
(9, 7, 'Dire, Dire Docks 100 Coins'),

-- Course 10: Snowman's Land
(10, 1, 'Snowman’s Big Head'),
(10, 2, 'Chill with the Bully'),
(10, 3, 'In the Deep Freeze'),
(10, 4, 'Whirl from the Freezing Pond'),
(10, 5, 'Shell Shreddin’ for 8 Red Coins'),
(10, 6, 'Into the Igloo'),
(10, 7, 'Snowman’s Land 100 Coins'),

-- Course 11: Wet-Dry World
(11, 1, 'Shocking Arrow Lifts!'),
(11, 2, 'Top O’ The Town'),
(11, 3, 'Secrets in the Shallows & Sky'),
(11, 4, 'Express Elevators–Hurry Up!'),
(11, 5, 'Go to Town for Red Coins'),
(11, 6, 'Quick Race through Downtown'),
(11, 7, 'Wet-Dry World 100 Coins'),

-- Course 12: Tall, Tall Mountain
(12, 1, 'Scale the Mountain'),
(12, 2, 'Mystery of the Monkey Cage'),
(12, 3, 'Scary ‘Shrooms, Red Coins'),
(12, 4, 'Mysterious Mountainside'),
(12, 5, 'Breathtaking View from Bridge'),
(12, 6, 'Blast to the Lonely Mushroom'),
(12, 7, 'Tall, Tall Mountain 100 Coins'),

-- Course 13: Tiny-Huge Island
(13, 1, 'Pluck the Piranha Flower'),
(13, 2, 'The Tip Top of the Huge Island'),
(13, 3, 'Rematch with Koopa the Quick'),
(13, 4, 'Five Itty Bitty Secrets'),
(13, 5, 'Wiggler’s Red Coins'),
(13, 6, 'Make Wiggler Squirm'),
(13, 7, 'Tiny-Huge Island 100 Coins'),

-- Course 14: Tick Tock Clock
(14, 1, 'Roll into the Cage'),
(14, 2, 'The Pit and the Pendulums'),
(14, 3, 'Get a Hand'),
(14, 4, 'Stomp on the Thwomp'),
(14, 5, 'Timed Jumps on Moving Bars'),
(14, 6, 'Stop Time for Red Coins'),
(14, 7, 'Tick Tock Clock 100 Coins'),

-- Course 15: Rainbow Ride
(15, 1, 'Cruiser Crossing the Rainbow'),
(15, 2, 'The Big House in the Sky'),
(15, 3, 'Coins Amassed in a Maze'),
(15, 4, 'Swingin’ in the Breeze'),
(15, 5, 'Tricky Triangles!'),
(15, 6, 'Somewhere over the Rainbow'),
(15, 7, 'Rainbow Ride 100 Coins'),

-- Peach's Castle Secret Stars (15 Stars)
(16, 1, 'The Princess’s Secret Slide'),
(16, 2, 'The Princess’s Secret Slide 2'),
(16, 3, 'The Secret Aquarium'),
(16, 4, 'Toad’s First Star'),
(16, 5, 'Toad’s Second Star'),
(16, 6, 'Toad’s Third Star'),
(16, 7, 'MIPS Bunny Chase'),
(16, 8, 'MIPS Bunny Chase (Again)'),
(16, 9, 'Tower of the Wing Cap'),
(16, 10, 'Cavern of the Metal Cap'),
(16, 11, 'Vanish Cap Under the Moat'),
(16, 12, 'Wing Mario Over the Rainbow'),
(16, 13, 'Bowser in the Dark World'),
(16, 14, 'Bowser in the Fire Sea'),
(16, 15, 'Bowser in the Sky');

-- Initial Seed Data
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Big Bob-omb on the Summit', '70 Star', 0.49;
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Footrace with Koopa the Quick', '70 Star', 0.58;
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Chip off Whomp’s Block', '70 Star', 0.42;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Big Bob-omb on the Summit', '70 Star', 0.45;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Footrace with Koopa the Quick', '70 Star', 0.51;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Chip off Whomp’s Block', '70 Star', 0.39;
GO
EXEC dbo.sp_UpsertStarTime 'CosmicMario', 'Chip Off Whomp''s Block', '70 Star', 0.42;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Big Bob-omb on the Summit', '70 Star', 0.45;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Footrace with Koopa the Quick', '70 Star', 0.51;
EXEC dbo.sp_UpsertStarTime 'SpeedyYoshi', 'Chip Off Whomp''s Block', '70 Star', 0.39;
GO
