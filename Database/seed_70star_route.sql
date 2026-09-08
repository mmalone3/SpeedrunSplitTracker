-- ========================================================================
-- Speedrun Split Tracker: Complete 70-Star Route Seed Script
-- Auto-generated from pythondictionarySM64.py
-- ========================================================================
USE SpeedrunDB;
GO

-- Clear existing Level/Star references safely if needed
DELETE FROM dbo.StarSplits;
DELETE FROM dbo.Stars;
DELETE FROM dbo.Levels;
DBCC CHECKIDENT ('dbo.Levels', RESEED, 0);
DBCC CHECKIDENT ('dbo.Stars', RESEED, 0);
GO

-- Course 1: Bob-omb Battlefield
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bob-omb Battlefield', 1);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 1, N'Behind Chain Chomp''s Gate');
GO

-- Course 2: Castle Secret Stars & Cap Courses
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Castle Secret Stars & Cap Courses', 2);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 2, N'The Princess’s Secret Slide (Under 21s)');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 3, N'The Princess’s Secret Slide (Box / Timed)');
GO

-- Course 3: Whomp’s Fortress
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Whomp’s Fortress', 3);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 4, N'Shoot into the Wild Blue');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 5, N'Chip off Whomp’s Block');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 6, N'To the Top of the Fortress');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 7, N'Fall onto the Caged Island');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 8, N'Blast Away the Wall');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 9, N'Red Coins');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 10, N'100 Coins');
GO

-- Course 4: Bob-omb Battlefield (Revisit)
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bob-omb Battlefield (Revisit)', 4);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 11, N'Big Bob-omb on the Summit');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 12, N'Footrace with Koopa the Quick');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 13, N'Shoot to the Island in the Sky');
GO

-- Course 5: Hazy Maze Cave
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Hazy Maze Cave', 5);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 14, N'Toad’s First Star');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 15, N'Cavern of the Metal Cap (Red Coins)');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 16, N'Swimming Beast in the Cavern');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 17, N'Metal-Head Mario Can Move!');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 18, N'Watch for Rolling Rocks');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 19, N'Navigating the Toxic Maze');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 20, N'A-Maze-ing Emergency Exit');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 21, N'Vanish Cap Under the Moat');
GO

-- Course 6: Big Boo’s Haunt
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Big Boo’s Haunt', 6);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 22, N'Go on a Ghost Hunt');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 23, N'100 Coins');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 24, N'Ride Big Boo’s Merry-Go-Round');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 25, N'Secret of the Haunted Books');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 26, N'Eye to Eye in the Secret Room');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 27, N'Red Coins');
GO

-- Course 7: Lethal Lava Land
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Lethal Lava Land', 7);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 30, N'Boil the Big Bully');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 31, N'Bully the Bullies');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 32, N'8-Coin Puzzle with 15 Pieces');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 33, N'Red-Hot Log Rolling');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 34, N'Hot-Foot-It into the Volcano');
GO

-- Course 8: Bowser in the Fire Sea
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bowser in the Fire Sea', 8);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 35, N'Board Bowser’s Sub (Dire, Dire Docks Star 1)');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 36, N'Bowser in the Fire Sea (Red Coins)');
GO

-- Course 9: Snowman’s Land
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Snowman’s Land', 9);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 37, N'Into the Igloo');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 38, N'Snowman’s Big Head (Cannon)');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 39, N'In the Deep Freeze');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 40, N'Whirl from the Freezing Pond');
GO

-- Course 10: Tall Tall Mountain
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tall Tall Mountain', 10);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 40, N'Mysterious Mountainside');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 41, N'Blast to the Lonely Mushroom');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 42, N'Toad’s Second Star');
GO

-- Course 11: Wet-Dry World
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Wet-Dry World', 11);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 43, N'Shocking Arrow Lifts!');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 44, N'Top O’ The Town');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 45, N'Secrets in the Shallows & Sky');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 47, N'Express Elevators–Hurry Up!');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 48, N'Quick Race through Downtown');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 49, N'Red Coins (Downtown)');
GO

-- Course 12: Tiny-Huge Island
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tiny-Huge Island', 12);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 50, N'Pluck the Piranha Flower');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 51, N'The Tip Top of the Huge Island');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 52, N'Rematch with Koopa the Quick');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 53, N'Five Itty Bitty Secrets');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 54, N'Make Wiggler Squirm');
GO

-- Course 13: Cool, Cool Mountain
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Cool, Cool Mountain', 13);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 55, N'Slip Slidin’ Away');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 56, N'Li’l Penguin Lost');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 57, N'Big Penguin Race');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 58, N'Snowman’s Lost His Head');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 59, N'Wall Kicks Will Work');
GO

-- Course 14: Jolly Roger Bay
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Jolly Roger Bay', 14);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 60, N'Plunder in the Sunken Ship');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 61, N'Can the Eel Come out and Play?');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 62, N'Treasure of the Ocean Cave');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 63, N'Blast to the Stone Pillar');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 64, N'Toad’s Third Star');
GO

-- Course 15: Rainbow Ride
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Rainbow Ride', 15);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 65, N'Princess''s Secret Slide / Rainbow Route');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 66, N'Tricky Triangles!');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 67, N'Swingin’ in the Breeze');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 68, N'Coins Amassed in a Maze');
GO

-- Course 16: Tick Tock Clock
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tick Tock Clock', 16);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 69, N'Roll into the Cage');
GO

-- Course 17: Shifting Sand Land
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Shifting Sand Land', 17);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 70, N'Top of the Pyramid (Shell Ride)');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 71, N'Inside the Ancient Pyramid');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 72, N'In the Talons of the Big Bird');
GO

-- Course 18: Dire, Dire Docks
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Dire, Dire Docks', 18);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 73, N'Through the Jet Stream');
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 74, N'Pole-Jumping for Red Coins / Caps');
GO

-- Course 19: Bowser in the Sky
INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bowser in the Sky', 19);
DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();
INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 999, N'Beat Bowser in the Sky');
GO
