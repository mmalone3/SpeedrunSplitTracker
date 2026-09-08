-- ========================================================================
-- Auto-Generated SM64 70-Star Seed Data (PBs & Star Averages)
-- ========================================================================
USE SpeedrunDB;
GO

SET NOCOUNT ON;

-- 1. Insert Courses / Levels
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bob-omb Battlefield', 1);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Castle Secret Stars & Cap Courses')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Castle Secret Stars & Cap Courses', 2);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Whomp’s Fortress', 3);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield (Revisit)')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bob-omb Battlefield (Revisit)', 4);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Hazy Maze Cave', 5);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Big Boo’s Haunt', 6);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Lethal Lava Land', 7);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Bowser in the Fire Sea')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bowser in the Fire Sea', 8);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Snowman’s Land')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Snowman’s Land', 9);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Tall Tall Mountain')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tall Tall Mountain', 10);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Wet-Dry World')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Wet-Dry World', 11);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tiny-Huge Island', 12);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Cool, Cool Mountain', 13);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Jolly Roger Bay', 14);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Rainbow Ride')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Rainbow Ride', 15);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Tick Tock Clock')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Tick Tock Clock', 16);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Shifting Sand Land')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Shifting Sand Land', 17);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Dire, Dire Docks')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Dire, Dire Docks', 18);
IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'Bowser in the Sky')
    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'Bowser in the Sky', 19);
GO

-- 2. Insert Star Definitions
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Behind Chain Chomp''s Gate')
BEGIN
    DECLARE @LID_1 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_1, 1, N'Behind Chain Chomp''s Gate');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'The Princess’s Secret Slide (Under 21s)')
BEGIN
    DECLARE @LID_2 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Castle Secret Stars & Cap Courses');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_2, 2, N'The Princess’s Secret Slide (Under 21s)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'The Princess’s Secret Slide (Box / Timed)')
BEGIN
    DECLARE @LID_3 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Castle Secret Stars & Cap Courses');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_3, 3, N'The Princess’s Secret Slide (Box / Timed)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Shoot into the Wild Blue')
BEGIN
    DECLARE @LID_4 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_4, 4, N'Shoot into the Wild Blue');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Chip off Whomp’s Block')
BEGIN
    DECLARE @LID_5 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_5, 5, N'Chip off Whomp’s Block');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'To the Top of the Fortress')
BEGIN
    DECLARE @LID_6 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_6, 6, N'To the Top of the Fortress');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Fall onto the Caged Island')
BEGIN
    DECLARE @LID_7 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_7, 7, N'Fall onto the Caged Island');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Blast Away the Wall')
BEGIN
    DECLARE @LID_8 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_8, 8, N'Blast Away the Wall');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Red Coins')
BEGIN
    DECLARE @LID_9 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_9, 9, N'Red Coins');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'100 Coins')
BEGIN
    DECLARE @LID_10 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Whomp’s Fortress');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_10, 10, N'100 Coins');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Big Bob-omb on the Summit')
BEGIN
    DECLARE @LID_11 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield (Revisit)');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_11, 11, N'Big Bob-omb on the Summit');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Footrace with Koopa the Quick')
BEGIN
    DECLARE @LID_12 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield (Revisit)');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_12, 12, N'Footrace with Koopa the Quick');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Shoot to the Island in the Sky')
BEGIN
    DECLARE @LID_13 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bob-omb Battlefield (Revisit)');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_13, 13, N'Shoot to the Island in the Sky');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Toad’s First Star')
BEGIN
    DECLARE @LID_14 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_14, 14, N'Toad’s First Star');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Cavern of the Metal Cap (Red Coins)')
BEGIN
    DECLARE @LID_15 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_15, 15, N'Cavern of the Metal Cap (Red Coins)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Swimming Beast in the Cavern')
BEGIN
    DECLARE @LID_16 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_16, 16, N'Swimming Beast in the Cavern');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Metal-Head Mario Can Move!')
BEGIN
    DECLARE @LID_17 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_17, 17, N'Metal-Head Mario Can Move!');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Watch for Rolling Rocks')
BEGIN
    DECLARE @LID_18 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_18, 18, N'Watch for Rolling Rocks');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Navigating the Toxic Maze')
BEGIN
    DECLARE @LID_19 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_19, 19, N'Navigating the Toxic Maze');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'A-Maze-ing Emergency Exit')
BEGIN
    DECLARE @LID_20 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_20, 20, N'A-Maze-ing Emergency Exit');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Vanish Cap Under the Moat')
BEGIN
    DECLARE @LID_21 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Hazy Maze Cave');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_21, 21, N'Vanish Cap Under the Moat');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Go on a Ghost Hunt')
BEGIN
    DECLARE @LID_22 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_22, 22, N'Go on a Ghost Hunt');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'100 Coins')
BEGIN
    DECLARE @LID_23 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_23, 23, N'100 Coins');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Ride Big Boo’s Merry-Go-Round')
BEGIN
    DECLARE @LID_24 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_24, 24, N'Ride Big Boo’s Merry-Go-Round');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Secret of the Haunted Books')
BEGIN
    DECLARE @LID_25 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_25, 25, N'Secret of the Haunted Books');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Eye to Eye in the Secret Room')
BEGIN
    DECLARE @LID_26 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_26, 26, N'Eye to Eye in the Secret Room');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Red Coins')
BEGIN
    DECLARE @LID_27 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Big Boo’s Haunt');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_27, 27, N'Red Coins');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Boil the Big Bully')
BEGIN
    DECLARE @LID_28 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_28, 30, N'Boil the Big Bully');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Bully the Bullies')
BEGIN
    DECLARE @LID_29 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_29, 31, N'Bully the Bullies');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'8-Coin Puzzle with 15 Pieces')
BEGIN
    DECLARE @LID_30 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_30, 32, N'8-Coin Puzzle with 15 Pieces');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Red-Hot Log Rolling')
BEGIN
    DECLARE @LID_31 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_31, 33, N'Red-Hot Log Rolling');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Hot-Foot-It into the Volcano')
BEGIN
    DECLARE @LID_32 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Lethal Lava Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_32, 34, N'Hot-Foot-It into the Volcano');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Board Bowser’s Sub (Dire, Dire Docks Star 1)')
BEGIN
    DECLARE @LID_33 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bowser in the Fire Sea');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_33, 35, N'Board Bowser’s Sub (Dire, Dire Docks Star 1)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Bowser in the Fire Sea (Red Coins)')
BEGIN
    DECLARE @LID_34 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bowser in the Fire Sea');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_34, 36, N'Bowser in the Fire Sea (Red Coins)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Into the Igloo')
BEGIN
    DECLARE @LID_35 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Snowman’s Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_35, 37, N'Into the Igloo');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Snowman’s Big Head (Cannon)')
BEGIN
    DECLARE @LID_36 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Snowman’s Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_36, 38, N'Snowman’s Big Head (Cannon)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'In the Deep Freeze')
BEGIN
    DECLARE @LID_37 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Snowman’s Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_37, 39, N'In the Deep Freeze');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Whirl from the Freezing Pond')
BEGIN
    DECLARE @LID_38 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Snowman’s Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_38, 40, N'Whirl from the Freezing Pond');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Mysterious Mountainside')
BEGIN
    DECLARE @LID_39 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tall Tall Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_39, 40, N'Mysterious Mountainside');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Blast to the Lonely Mushroom')
BEGIN
    DECLARE @LID_40 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tall Tall Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_40, 41, N'Blast to the Lonely Mushroom');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Toad’s Second Star')
BEGIN
    DECLARE @LID_41 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tall Tall Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_41, 42, N'Toad’s Second Star');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Shocking Arrow Lifts!')
BEGIN
    DECLARE @LID_42 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_42, 43, N'Shocking Arrow Lifts!');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Top O’ The Town')
BEGIN
    DECLARE @LID_43 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_43, 44, N'Top O’ The Town');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Secrets in the Shallows & Sky')
BEGIN
    DECLARE @LID_44 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_44, 45, N'Secrets in the Shallows & Sky');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Express Elevators–Hurry Up!')
BEGIN
    DECLARE @LID_45 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_45, 47, N'Express Elevators–Hurry Up!');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Quick Race through Downtown')
BEGIN
    DECLARE @LID_46 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_46, 48, N'Quick Race through Downtown');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Red Coins (Downtown)')
BEGIN
    DECLARE @LID_47 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Wet-Dry World');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_47, 49, N'Red Coins (Downtown)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Pluck the Piranha Flower')
BEGIN
    DECLARE @LID_48 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_48, 50, N'Pluck the Piranha Flower');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'The Tip Top of the Huge Island')
BEGIN
    DECLARE @LID_49 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_49, 51, N'The Tip Top of the Huge Island');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Rematch with Koopa the Quick')
BEGIN
    DECLARE @LID_50 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_50, 52, N'Rematch with Koopa the Quick');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Five Itty Bitty Secrets')
BEGIN
    DECLARE @LID_51 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_51, 53, N'Five Itty Bitty Secrets');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Make Wiggler Squirm')
BEGIN
    DECLARE @LID_52 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tiny-Huge Island');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_52, 54, N'Make Wiggler Squirm');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Slip Slidin’ Away')
BEGIN
    DECLARE @LID_53 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_53, 55, N'Slip Slidin’ Away');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Li’l Penguin Lost')
BEGIN
    DECLARE @LID_54 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_54, 56, N'Li’l Penguin Lost');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Big Penguin Race')
BEGIN
    DECLARE @LID_55 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_55, 57, N'Big Penguin Race');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Snowman’s Lost His Head')
BEGIN
    DECLARE @LID_56 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_56, 58, N'Snowman’s Lost His Head');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Wall Kicks Will Work')
BEGIN
    DECLARE @LID_57 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Cool, Cool Mountain');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_57, 59, N'Wall Kicks Will Work');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Plunder in the Sunken Ship')
BEGIN
    DECLARE @LID_58 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_58, 60, N'Plunder in the Sunken Ship');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Can the Eel Come out and Play?')
BEGIN
    DECLARE @LID_59 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_59, 61, N'Can the Eel Come out and Play?');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Treasure of the Ocean Cave')
BEGIN
    DECLARE @LID_60 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_60, 62, N'Treasure of the Ocean Cave');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Blast to the Stone Pillar')
BEGIN
    DECLARE @LID_61 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_61, 63, N'Blast to the Stone Pillar');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Toad’s Third Star')
BEGIN
    DECLARE @LID_62 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Jolly Roger Bay');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_62, 64, N'Toad’s Third Star');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Princess''s Secret Slide / Rainbow Route')
BEGIN
    DECLARE @LID_63 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Rainbow Ride');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_63, 65, N'Princess''s Secret Slide / Rainbow Route');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Tricky Triangles!')
BEGIN
    DECLARE @LID_64 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Rainbow Ride');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_64, 66, N'Tricky Triangles!');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Swingin’ in the Breeze')
BEGIN
    DECLARE @LID_65 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Rainbow Ride');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_65, 67, N'Swingin’ in the Breeze');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Coins Amassed in a Maze')
BEGIN
    DECLARE @LID_66 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Rainbow Ride');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_66, 68, N'Coins Amassed in a Maze');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Roll into the Cage')
BEGIN
    DECLARE @LID_67 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Tick Tock Clock');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_67, 69, N'Roll into the Cage');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Top of the Pyramid (Shell Ride)')
BEGIN
    DECLARE @LID_68 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Shifting Sand Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_68, 70, N'Top of the Pyramid (Shell Ride)');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Inside the Ancient Pyramid')
BEGIN
    DECLARE @LID_69 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Shifting Sand Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_69, 71, N'Inside the Ancient Pyramid');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'In the Talons of the Big Bird')
BEGIN
    DECLARE @LID_70 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Shifting Sand Land');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_70, 72, N'In the Talons of the Big Bird');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Through the Jet Stream')
BEGIN
    DECLARE @LID_71 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Dire, Dire Docks');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_71, 73, N'Through the Jet Stream');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Pole-Jumping for Red Coins / Caps')
BEGIN
    DECLARE @LID_72 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Dire, Dire Docks');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_72, 74, N'Pole-Jumping for Red Coins / Caps');
END
IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'Beat Bowser in the Sky')
BEGIN
    DECLARE @LID_73 INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'Bowser in the Sky');
    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_73, 73, N'Beat Bowser in the Sky');
END
GO

-- 3. Seed Splits for Old PB (1:58:00 - Unfamiliar Route)
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Behind Chain Chomp''s Gate', '70 Star', 76.18;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'The Princess’s Secret Slide (Under 21s)', '70 Star', 55.67;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'The Princess’s Secret Slide (Box / Timed)', '70 Star', 64.46;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Shoot into the Wild Blue', '70 Star', 49.81;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Chip off Whomp’s Block', '70 Star', 67.39;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'To the Top of the Fortress', '70 Star', 74.72;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Fall onto the Caged Island', '70 Star', 57.14;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Blast Away the Wall', '70 Star', 54.21;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Red Coins', '70 Star', 120.13;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'100 Coins', '70 Star', 200.57;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Big Bob-omb on the Summit', '70 Star', 89.37;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Footrace with Koopa the Quick', '70 Star', 114.27;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Shoot to the Island in the Sky', '70 Star', 63.0;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Toad’s First Star', '70 Star', 21.98;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Cavern of the Metal Cap (Red Coins)', '70 Star', 109.88;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Swimming Beast in the Cavern', '70 Star', 105.48;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Metal-Head Mario Can Move!', '70 Star', 99.62;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Watch for Rolling Rocks', '70 Star', 68.86;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Navigating the Toxic Maze', '70 Star', 121.11;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'A-Maze-ing Emergency Exit', '70 Star', 107.02;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Vanish Cap Under the Moat', '70 Star', 178.94;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Go on a Ghost Hunt', '70 Star', 95.23;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'100 Coins', '70 Star', 200.57;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Ride Big Boo’s Merry-Go-Round', '70 Star', 108.41;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Secret of the Haunted Books', '70 Star', 61.53;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Eye to Eye in the Secret Room', '70 Star', 77.65;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Red Coins', '70 Star', 120.13;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Boil the Big Bully', '70 Star', 64.46;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Bully the Bullies', '70 Star', 90.83;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'8-Coin Puzzle with 15 Pieces', '70 Star', 84.97;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Red-Hot Log Rolling', '70 Star', 71.79;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Hot-Foot-It into the Volcano', '70 Star', 116.85;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Board Bowser’s Sub (Dire, Dire Docks Star 1)', '70 Star', 79.11;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Bowser in the Fire Sea (Red Coins)', '70 Star', 143.57;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Into the Igloo', '70 Star', 104.02;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Snowman’s Big Head (Cannon)', '70 Star', 76.18;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'In the Deep Freeze', '70 Star', 60.07;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Whirl from the Freezing Pond', '70 Star', 70.32;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Mysterious Mountainside', '70 Star', 77.65;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Blast to the Lonely Mushroom', '70 Star', 67.39;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Toad’s Second Star', '70 Star', 21.98;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Shocking Arrow Lifts!', '70 Star', 68.86;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Top O’ The Town', '70 Star', 82.04;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Secrets in the Shallows & Sky', '70 Star', 114.27;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Express Elevators–Hurry Up!', '70 Star', 101.09;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Quick Race through Downtown', '70 Star', 123.06;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Red Coins (Downtown)', '70 Star', 158.71;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Pluck the Piranha Flower', '70 Star', 92.3;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'The Tip Top of the Huge Island', '70 Star', 111.34;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Rematch with Koopa the Quick', '70 Star', 130.39;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Five Itty Bitty Secrets', '70 Star', 93.76;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Make Wiggler Squirm', '70 Star', 124.53;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Slip Slidin’ Away', '70 Star', 74.72;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Li’l Penguin Lost', '70 Star', 84.97;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Big Penguin Race', '70 Star', 115.74;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Snowman’s Lost His Head', '70 Star', 95.23;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Wall Kicks Will Work', '70 Star', 80.58;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Plunder in the Sunken Ship', '70 Star', 99.62;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Can the Eel Come out and Play?', '70 Star', 83.51;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Treasure of the Ocean Cave', '70 Star', 90.83;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Blast to the Stone Pillar', '70 Star', 65.93;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Toad’s Third Star', '70 Star', 21.98;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Princess''s Secret Slide / Rainbow Route', '70 Star', 128.92;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Tricky Triangles!', '70 Star', 105.48;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Swingin’ in the Breeze', '70 Star', 118.67;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Coins Amassed in a Maze', '70 Star', 199.52;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Roll into the Cage', '70 Star', 93.76;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Top of the Pyramid (Shell Ride)', '70 Star', 80.58;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Inside the Ancient Pyramid', '70 Star', 108.41;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'In the Talons of the Big Bird', '70 Star', 84.97;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Through the Jet Stream', '70 Star', 96.69;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Pole-Jumping for Red Coins / Caps', '70 Star', 121.6;
EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'Beat Bowser in the Sky', '70 Star', 235.42;
GO

-- 4. Seed Splits for New PB (1:49:00 - Known Route)
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Behind Chain Chomp''s Gate', '70 Star', 73.37;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'The Princess’s Secret Slide (Under 21s)', '70 Star', 53.62;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'The Princess’s Secret Slide (Box / Timed)', '70 Star', 62.08;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Shoot into the Wild Blue', '70 Star', 47.97;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Chip off Whomp’s Block', '70 Star', 64.91;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'To the Top of the Fortress', '70 Star', 71.96;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Fall onto the Caged Island', '70 Star', 55.03;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Blast Away the Wall', '70 Star', 52.21;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Red Coins', '70 Star', 115.7;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'100 Coins', '70 Star', 162.27;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Big Bob-omb on the Summit', '70 Star', 86.07;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Footrace with Koopa the Quick', '70 Star', 110.06;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Shoot to the Island in the Sky', '70 Star', 60.67;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Toad’s First Star', '70 Star', 21.17;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Cavern of the Metal Cap (Red Coins)', '70 Star', 105.83;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Swimming Beast in the Cavern', '70 Star', 101.59;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Metal-Head Mario Can Move!', '70 Star', 95.95;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Watch for Rolling Rocks', '70 Star', 66.32;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Navigating the Toxic Maze', '70 Star', 87.48;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'A-Maze-ing Emergency Exit', '70 Star', 83.25;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Vanish Cap Under the Moat', '70 Star', 134.05;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Go on a Ghost Hunt', '70 Star', 91.72;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'100 Coins', '70 Star', 162.27;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Ride Big Boo’s Merry-Go-Round', '70 Star', 104.41;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Secret of the Haunted Books', '70 Star', 59.26;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Eye to Eye in the Secret Room', '70 Star', 74.78;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Red Coins', '70 Star', 115.7;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Boil the Big Bully', '70 Star', 62.08;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Bully the Bullies', '70 Star', 87.48;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'8-Coin Puzzle with 15 Pieces', '70 Star', 81.84;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Red-Hot Log Rolling', '70 Star', 69.14;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Hot-Foot-It into the Volcano', '70 Star', 94.54;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Board Bowser’s Sub (Dire, Dire Docks Star 1)', '70 Star', 76.19;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Bowser in the Fire Sea (Red Coins)', '70 Star', 138.28;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Into the Igloo', '70 Star', 100.18;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Snowman’s Big Head (Cannon)', '70 Star', 73.37;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'In the Deep Freeze', '70 Star', 57.85;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Whirl from the Freezing Pond', '70 Star', 67.73;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Mysterious Mountainside', '70 Star', 74.78;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Blast to the Lonely Mushroom', '70 Star', 64.91;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Toad’s Second Star', '70 Star', 21.17;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Shocking Arrow Lifts!', '70 Star', 66.32;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Top O’ The Town', '70 Star', 79.02;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Secrets in the Shallows & Sky', '70 Star', 110.06;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Express Elevators–Hurry Up!', '70 Star', 97.36;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Quick Race through Downtown', '70 Star', 118.52;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Red Coins (Downtown)', '70 Star', 128.4;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Pluck the Piranha Flower', '70 Star', 88.89;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'The Tip Top of the Huge Island', '70 Star', 107.24;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Rematch with Koopa the Quick', '70 Star', 125.58;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Five Itty Bitty Secrets', '70 Star', 90.3;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Make Wiggler Squirm', '70 Star', 119.94;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Slip Slidin’ Away', '70 Star', 71.96;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Li’l Penguin Lost', '70 Star', 81.84;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Big Penguin Race', '70 Star', 111.47;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Snowman’s Lost His Head', '70 Star', 91.72;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Wall Kicks Will Work', '70 Star', 77.61;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Plunder in the Sunken Ship', '70 Star', 95.95;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Can the Eel Come out and Play?', '70 Star', 80.43;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Treasure of the Ocean Cave', '70 Star', 87.48;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Blast to the Stone Pillar', '70 Star', 63.5;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Toad’s Third Star', '70 Star', 21.17;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Princess''s Secret Slide / Rainbow Route', '70 Star', 124.17;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Tricky Triangles!', '70 Star', 101.59;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Swingin’ in the Breeze', '70 Star', 114.29;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Coins Amassed in a Maze', '70 Star', 155.21;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Roll into the Cage', '70 Star', 90.3;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Top of the Pyramid (Shell Ride)', '70 Star', 77.61;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Inside the Ancient Pyramid', '70 Star', 104.41;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'In the Talons of the Big Bird', '70 Star', 81.84;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Through the Jet Stream', '70 Star', 93.13;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Pole-Jumping for Red Coins / Caps', '70 Star', 117.11;
EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'Beat Bowser in the Sky', '70 Star', 176.34;
GO

-- 5. Seed Star Averages & Targets (e.g. 49s for Red-Hot Log Rolling)
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Behind Chain Chomp''s Gate', '70 Star', 52.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'The Princess’s Secret Slide (Under 21s)', '70 Star', 38.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'The Princess’s Secret Slide (Box / Timed)', '70 Star', 44.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Shoot into the Wild Blue', '70 Star', 34.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Chip off Whomp’s Block', '70 Star', 46.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'To the Top of the Fortress', '70 Star', 51.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Fall onto the Caged Island', '70 Star', 39.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Blast Away the Wall', '70 Star', 37.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Red Coins', '70 Star', 82.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'100 Coins', '70 Star', 115.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Big Bob-omb on the Summit', '70 Star', 61.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Footrace with Koopa the Quick', '70 Star', 78.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Shoot to the Island in the Sky', '70 Star', 43.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Toad’s First Star', '70 Star', 15.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Cavern of the Metal Cap (Red Coins)', '70 Star', 75.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Swimming Beast in the Cavern', '70 Star', 72.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Metal-Head Mario Can Move!', '70 Star', 68.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Watch for Rolling Rocks', '70 Star', 47.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Navigating the Toxic Maze', '70 Star', 62.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'A-Maze-ing Emergency Exit', '70 Star', 59.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Vanish Cap Under the Moat', '70 Star', 95.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Go on a Ghost Hunt', '70 Star', 65.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'100 Coins', '70 Star', 115.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Ride Big Boo’s Merry-Go-Round', '70 Star', 74.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Secret of the Haunted Books', '70 Star', 42.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Eye to Eye in the Secret Room', '70 Star', 53.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Red Coins', '70 Star', 82.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Boil the Big Bully', '70 Star', 44.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Bully the Bullies', '70 Star', 62.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'8-Coin Puzzle with 15 Pieces', '70 Star', 58.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Red-Hot Log Rolling', '70 Star', 49.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Hot-Foot-It into the Volcano', '70 Star', 67.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Board Bowser’s Sub (Dire, Dire Docks Star 1)', '70 Star', 54.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Bowser in the Fire Sea (Red Coins)', '70 Star', 98.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Into the Igloo', '70 Star', 71.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Snowman’s Big Head (Cannon)', '70 Star', 52.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'In the Deep Freeze', '70 Star', 41.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Whirl from the Freezing Pond', '70 Star', 48.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Mysterious Mountainside', '70 Star', 53.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Blast to the Lonely Mushroom', '70 Star', 46.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Toad’s Second Star', '70 Star', 15.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Shocking Arrow Lifts!', '70 Star', 47.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Top O’ The Town', '70 Star', 56.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Secrets in the Shallows & Sky', '70 Star', 78.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Express Elevators–Hurry Up!', '70 Star', 69.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Quick Race through Downtown', '70 Star', 84.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Red Coins (Downtown)', '70 Star', 91.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Pluck the Piranha Flower', '70 Star', 63.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'The Tip Top of the Huge Island', '70 Star', 76.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Rematch with Koopa the Quick', '70 Star', 89.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Five Itty Bitty Secrets', '70 Star', 64.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Make Wiggler Squirm', '70 Star', 85.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Slip Slidin’ Away', '70 Star', 51.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Li’l Penguin Lost', '70 Star', 58.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Big Penguin Race', '70 Star', 79.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Snowman’s Lost His Head', '70 Star', 65.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Wall Kicks Will Work', '70 Star', 55.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Plunder in the Sunken Ship', '70 Star', 68.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Can the Eel Come out and Play?', '70 Star', 57.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Treasure of the Ocean Cave', '70 Star', 62.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Blast to the Stone Pillar', '70 Star', 45.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Toad’s Third Star', '70 Star', 15.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Princess''s Secret Slide / Rainbow Route', '70 Star', 88.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Tricky Triangles!', '70 Star', 72.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Swingin’ in the Breeze', '70 Star', 81.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Coins Amassed in a Maze', '70 Star', 110.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Roll into the Cage', '70 Star', 64.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Top of the Pyramid (Shell Ride)', '70 Star', 55.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Inside the Ancient Pyramid', '70 Star', 74.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'In the Talons of the Big Bird', '70 Star', 58.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Through the Jet Stream', '70 Star', 66.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Pole-Jumping for Red Coins / Caps', '70 Star', 83.0;
EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'Beat Bowser in the Sky', '70 Star', 125.0;
GO
