"""
Generates an expanded SQL Server seed script based on the route dictionary in pythondictionarySM64.py.
"""
from pythondictionarySM64 import sm64_70_star_route

def generate_sql_seed_script(output_file: str = "Database/seed_70star_route.sql"):
    statements = [
        "-- ========================================================================",
        "-- Speedrun Split Tracker: Complete 70-Star Route Seed Script",
        "-- Auto-generated from pythondictionarySM64.py",
        "-- ========================================================================",
        "USE SpeedrunDB;",
        "GO",
        "",
        "-- Clear existing Level/Star references safely if needed",
        "DELETE FROM dbo.StarSplits;",
        "DELETE FROM dbo.Stars;",
        "DELETE FROM dbo.Levels;",
        "DBCC CHECKIDENT ('dbo.Levels', RESEED, 0);",
        "DBCC CHECKIDENT ('dbo.Stars', RESEED, 0);",
        "GO",
        ""
    ]

    for course_idx, (course_name, stars) in enumerate(sm64_70_star_route.items(), start=1):
        escaped_course = course_name.replace("'", "''")
        statements.append(f"-- Course {course_idx}: {course_name}")
        statements.append(f"INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'{escaped_course}', {course_idx});")
        statements.append("DECLARE @CurrentLevelID INT = SCOPE_IDENTITY();")
        
        for s in stars:
            star_num = s["star_num"]
            star_name = s["name"].replace("'", "''")
            # Handle non-integer star_num like 'Final'
            if isinstance(star_num, int):
                statements.append(f"INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, {star_num}, N'{star_name}');")
            else:
                statements.append(f"INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@CurrentLevelID, 999, N'{star_name}');")
        statements.append("GO\n")

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(statements))
    
    print(f"✅ Generated complete SQL route seed script at: {output_file}")

if __name__ == "__main__":
    generate_sql_seed_script()
