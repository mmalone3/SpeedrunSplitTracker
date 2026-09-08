"""
SM64 70-Star Sample Split Data Generator & Uploader
Generates:
  1. Old PB (1:58:00 = 7,080.00s) - Route unfamiliarity & safety strat splits
  2. New PB (1:49:00 = 6,540.00s) - Route familiarity & optimized execution splits
  3. Star Averages / Targets - Individual star averages (e.g. 49.00s for Red-Hot Log Rolling)

Supports generating SQL seed script and uploading directly via REST API.
"""

import json
import urllib.request
import urllib.error
from pythondictionarySM64 import sm64_70_star_route

# Target run totals in seconds
OLD_PB_TOTAL = 7080.00  # 1 hour 58 minutes (1:58:00)
NEW_PB_TOTAL = 6540.00  # 1 hour 49 minutes (1:49:00)

# Base average reference times (in seconds) for each star in the 70-star route
BASE_STAR_AVERAGES = {
    # Bob-omb Battlefield
    "Behind Chain Chomp's Gate": 52.00,
    "Big Bob-omb on the Summit": 61.00,
    "Footrace with Koopa the Quick": 78.00,
    "Shoot to the Island in the Sky": 43.00,

    # Castle Secret Stars & Cap Courses
    "The Princess’s Secret Slide (Under 21s)": 38.00,
    "The Princess’s Secret Slide (Box / Timed)": 44.00,
    "Cavern of the Metal Cap (Red Coins)": 75.00,
    "Vanish Cap Under the Moat": 95.00,

    # Whomp's Fortress
    "Shoot into the Wild Blue": 34.00,
    "Chip off Whomp’s Block": 46.00,
    "To the Top of the Fortress": 51.00,
    "Fall onto the Caged Island": 39.00,
    "Blast Away the Wall": 37.00,
    "Red Coins": 82.00,
    "100 Coins": 115.00,

    # Hazy Maze Cave
    "Toad’s First Star": 15.00,
    "Swimming Beast in the Cavern": 72.00,
    "Metal-Head Mario Can Move!": 68.00,
    "Watch for Rolling Rocks": 47.00,
    "Navigating the Toxic Maze": 62.00,
    "A-Maze-ing Emergency Exit": 59.00,

    # Big Boo’s Haunt
    "Go on a Ghost Hunt": 65.00,
    "Ride Big Boo’s Merry-Go-Round": 74.00,
    "Secret of the Haunted Books": 42.00,
    "Eye to Eye in the Secret Room": 53.00,

    # Lethal Lava Land
    "Boil the Big Bully": 44.00,
    "Bully the Bullies": 62.00,
    "8-Coin Puzzle with 15 Pieces": 58.00,
    "Red-Hot Log Rolling": 49.00,  # Explicit requested target: 49s
    "Hot-Foot-It into the Volcano": 67.00,

    # Bowser in the Fire Sea
    "Board Bowser’s Sub (Dire, Dire Docks Star 1)": 54.00,
    "Bowser in the Fire Sea (Red Coins)": 98.00,

    # Snowman’s Land
    "Into the Igloo": 71.00,
    "Snowman’s Big Head (Cannon)": 52.00,
    "In the Deep Freeze": 41.00,
    "Whirl from the Freezing Pond": 48.00,

    # Tall Tall Mountain
    "Mysterious Mountainside": 53.00,
    "Blast to the Lonely Mushroom": 46.00,
    "Toad’s Second Star": 15.00,

    # Wet-Dry World
    "Shocking Arrow Lifts!": 47.00,
    "Top O’ The Town": 56.00,
    "Secrets in the Shallows & Sky": 78.00,
    "Express Elevators–Hurry Up!": 69.00,
    "Quick Race through Downtown": 84.00,
    "Red Coins (Downtown)": 91.00,

    # Tiny-Huge Island
    "Pluck the Piranha Flower": 63.00,
    "The Tip Top of the Huge Island": 76.00,
    "Rematch with Koopa the Quick": 89.00,
    "Five Itty Bitty Secrets": 64.00,
    "Make Wiggler Squirm": 85.00,

    # Cool, Cool Mountain
    "Slip Slidin’ Away": 51.00,
    "Li’l Penguin Lost": 58.00,
    "Big Penguin Race": 79.00,
    "Snowman’s Lost His Head": 65.00,
    "Wall Kicks Will Work": 55.00,

    # Jolly Roger Bay
    "Plunder in the Sunken Ship": 68.00,
    "Can the Eel Come out and Play?": 57.00,
    "Treasure of the Ocean Cave": 62.00,
    "Blast to the Stone Pillar": 45.00,
    "Toad’s Third Star": 15.00,

    # Rainbow Ride
    "Princess's Secret Slide / Rainbow Route": 88.00,
    "Tricky Triangles!": 72.00,
    "Swingin’ in the Breeze": 81.00,
    "Coins Amassed in a Maze": 110.00,

    # Tick Tock Clock
    "Roll into the Cage": 64.00,

    # Shifting Sand Land
    "Top of the Pyramid (Shell Ride)": 55.00,
    "Inside the Ancient Pyramid": 74.00,
    "In the Talons of the Big Bird": 58.00,

    # Dire, Dire Docks
    "Through the Jet Stream": 66.00,
    "Pole-Jumping for Red Coins / Caps": 83.00,

    # Bowser in the Sky
    "Beat Bowser in the Sky": 125.00,
}


def extract_all_stars():
    """Extract flat list of (course_name, star_num, star_name, notes)."""
    stars = []
    for course, star_list in sm64_70_star_route.items():
        for item in star_list:
            stars.append({
                "course": course,
                "star_num": item["star_num"],
                "name": item["name"],
                "notes": item.get("notes", [])
            })
    return stars


def generate_splits():
    """
    Scale and adjust split times so the totals match the exact PBs requested:
    - 1:49:00 (6,540s) for New PB
    - 1:58:00 (7,080s) for Old PB (higher variance / time losses)
    - Realistic star averages
    """
    stars = extract_all_stars()
    num_stars = len(stars)

    # 1. Base Averages
    star_averages = []
    for s in stars:
        avg = BASE_STAR_AVERAGES.get(s["name"], 65.00)
        star_averages.append({
            "course": s["course"],
            "name": s["name"],
            "time_seconds": round(avg, 2)
        })

    # 2. New PB (1:49:00 = 6540.00s)
    # Scaled cleanly from base averages
    raw_avg_total = sum(s["time_seconds"] for s in star_averages)
    scale_new = NEW_PB_TOTAL / raw_avg_total

    new_pb_splits = []
    current_sum = 0.0
    for i, s in enumerate(star_averages):
        val = round(s["time_seconds"] * scale_new, 2)
        if i == len(star_averages) - 1:
            val = round(NEW_PB_TOTAL - current_sum, 2)
        current_sum += val
        new_pb_splits.append({
            "course": s["course"],
            "name": s["name"],
            "time_seconds": val
        })

    # 3. Old PB (1:58:00 = 7080.00s)
    # Adds route-unfamiliarity variance (lost time on difficult/maze/puzzle stars)
    time_loss_modifiers = {
        "Vanish Cap Under the Moat": 1.35,
        "Navigating the Toxic Maze": 1.40,
        "A-Maze-ing Emergency Exit": 1.30,
        "100 Coins": 1.25,
        "Coins Amassed in a Maze": 1.30,
        "Red Coins (Downtown)": 1.25,
        "Beat Bowser in the Sky": 1.35,
        "Hot-Foot-It into the Volcano": 1.25
    }

    raw_old_splits = []
    for s in star_averages:
        mod = time_loss_modifiers.get(s["name"], 1.05)
        raw_old_splits.append(s["time_seconds"] * mod)

    scale_old = OLD_PB_TOTAL / sum(raw_old_splits)
    old_pb_splits = []
    old_sum = 0.0
    for i, (s, raw_val) in enumerate(zip(star_averages, raw_old_splits)):
        val = round(raw_val * scale_old, 2)
        if i == len(star_averages) - 1:
            val = round(OLD_PB_TOTAL - old_sum, 2)
        old_sum += val
        old_pb_splits.append({
            "course": s["course"],
            "name": s["name"],
            "time_seconds": val
        })

    return {
        "stars": stars,
        "averages": star_averages,
        "new_pb": new_pb_splits,
        "old_pb": old_pb_splits
    }


def generate_sql_seed_script(filepath="Database/seed_70star_data.sql"):
    """Generates an executable SQL file populating Levels, Stars, and all Splits."""
    data = generate_splits()
    lines = [
        "-- ========================================================================",
        "-- Auto-Generated SM64 70-Star Seed Data (PBs & Star Averages)",
        "-- ========================================================================",
        "USE SpeedrunDB;",
        "GO\n",
        "SET NOCOUNT ON;\n"
    ]

    # Unique Courses
    courses = list(dict.fromkeys(s["course"] for s in data["stars"]))
    lines.append("-- 1. Insert Courses / Levels")
    for idx, c in enumerate(courses, 1):
        escaped_c = c.replace("'", "''")
        lines.append(f"IF NOT EXISTS (SELECT 1 FROM dbo.Levels WHERE LevelName = N'{escaped_c}')")
        lines.append(f"    INSERT INTO dbo.Levels (LevelName, CourseNumber) VALUES (N'{escaped_c}', {idx});")
    lines.append("GO\n")

    # Stars
    lines.append("-- 2. Insert Star Definitions")
    for idx, s in enumerate(data["stars"], 1):
        escaped_c = s["course"].replace("'", "''")
        escaped_name = s["name"].replace("'", "''")
        star_no = idx if isinstance(s["star_num"], str) else s["star_num"]
        lines.append(
            f"IF NOT EXISTS (SELECT 1 FROM dbo.Stars WHERE StarName = N'{escaped_name}')\n"
            f"BEGIN\n"
            f"    DECLARE @LID_{idx} INT = (SELECT LevelID FROM dbo.Levels WHERE LevelName = N'{escaped_c}');\n"
            f"    INSERT INTO dbo.Stars (LevelID, StarNumber, StarName) VALUES (@LID_{idx}, {star_no}, N'{escaped_name}');\n"
            f"END"
        )
    lines.append("GO\n")

    # Splits for Runners
    lines.append("-- 3. Seed Splits for Old PB (1:58:00 - Unfamiliar Route)")
    for s in data["old_pb"]:
        escaped_name = s["name"].replace("'", "''")
        lines.append(f"EXEC dbo.sp_UpsertStarTime 'Matt_OldPB_1h58m', N'{escaped_name}', '70 Star', {s['time_seconds']};")
    lines.append("GO\n")

    lines.append("-- 4. Seed Splits for New PB (1:49:00 - Known Route)")
    for s in data["new_pb"]:
        escaped_name = s["name"].replace("'", "''")
        lines.append(f"EXEC dbo.sp_UpsertStarTime 'Matt_NewPB_1h49m', N'{escaped_name}', '70 Star', {s['time_seconds']};")
    lines.append("GO\n")

    lines.append("-- 5. Seed Star Averages & Targets (e.g. 49s for Red-Hot Log Rolling)")
    for s in data["averages"]:
        escaped_name = s["name"].replace("'", "''")
        lines.append(f"EXEC dbo.sp_UpsertStarTime 'Star_Averages', N'{escaped_name}', '70 Star', {s['time_seconds']};")
    lines.append("GO\n")

    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"Generated SQL seed file: {filepath}")


def upload_to_api(base_url="http://localhost:5000"):
    """Uploads splits directly to running ASP.NET Core REST API."""
    data = generate_splits()
    endpoint = f"{base_url}/api/speedrun/updatetime"
    runners = [
        ("Matt_NewPB_1h49m", data["new_pb"]),
        ("Matt_OldPB_1h58m", data["old_pb"]),
        ("Star_Averages", data["averages"])
    ]

    print(f"Uploading splits to {endpoint} ...")
    total_uploaded = 0
    for runner_tag, splits in runners:
        for item in splits:
            payload = {
                "runnerTag": runner_tag,
                "starName": item["name"],
                "category": "70 Star",
                "timeSeconds": item["time_seconds"]
            }
            req = urllib.request.Request(
                endpoint,
                data=json.dumps(payload).encode("utf-8"),
                headers={"Content-Type": "application/json"},
                method="POST"
            )
            try:
                with urllib.request.urlopen(req) as resp:
                    if resp.status == 200:
                        total_uploaded += 1
            except urllib.error.URLError as e:
                print(f"Failed uploading {item['name']}: {e}")
                return

    print(f"Successfully uploaded {total_uploaded} splits across all 3 runners via API!")


if __name__ == "__main__":
    generate_sql_seed_script("Database/seed_70star_data.sql")
    print("\nSplit Generation Summary:")
    splits = generate_splits()
    print(f"- Total Stars: {len(splits['stars'])}")
    print(f"- Old PB (1:58:00) Sum: {sum(s['time_seconds'] for s in splits['old_pb']):.2f}s (~{sum(s['time_seconds'] for s in splits['old_pb'])/60:.2f} min)")
    print(f"- New PB (1:49:00) Sum: {sum(s['time_seconds'] for s in splits['new_pb']):.2f}s (~{sum(s['time_seconds'] for s in splits['new_pb'])/60:.2f} min)")
    
    red_hot = next(s for s in splits["averages"] if s["name"] == "Red-Hot Log Rolling")
    print(f"- Red-Hot Log Rolling Average: {red_hot['time_seconds']}s")
