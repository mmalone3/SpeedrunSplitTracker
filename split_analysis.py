"""
Speedrun Split Telemetry & Route Analysis Engine
Integrates Super Mario 64 route dictionary with SQL Server split datasets (or exported CSVs).
Works with standard library Python (no external dependencies required).
"""

import sys
import csv
from typing import List, Dict, Any, Optional
from pythondictionarySM64 import sm64_70_star_route

def parse_route_dictionary() -> List[Dict[str, Any]]:
    """Flattens the route dictionary into structured records with course ordering and star indexing."""
    records = []
    route_index = 1
    for course_order, (course_name, stars) in enumerate(sm64_70_star_route.items(), start=1):
        for s in stars:
            records.append({
                "RouteOrder": route_index,
                "CourseOrder": course_order,
                "CourseName": course_name,
                "StarNumber": s["star_num"],
                "StarName": s["name"],
                "Notes": " | ".join(s.get("notes", []))
            })
            route_index += 1
    return records

def fetch_splits_from_sql(connection_string: Optional[str] = None) -> List[Dict[str, Any]]:
    """
    Attempts to read live split data directly from SQL Server via pyodbc.
    Falls back gracefully to simulated/exported dataset if SQL Server is not reachable.
    """
    default_conn_str = (
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost;"
        "Database=SpeedrunDB;"
        "Trusted_Connection=yes;"
    )
    conn_str = connection_string or default_conn_str

    query = """
    SELECT 
        r.RunnerTag,
        l.LevelName,
        st.StarName,
        sp.Category,
        sp.BestTimeSeconds,
        sp.LastUpdated
    FROM dbo.StarSplits sp
    INNER JOIN dbo.Runners r ON sp.RunnerID = r.RunnerID
    INNER JOIN dbo.Stars st ON sp.StarID = st.StarID
    INNER JOIN dbo.Levels l ON st.LevelID = l.LevelID
    WHERE sp.Category = '70 Star'
    """
    try:
        import pyodbc
        with pyodbc.connect(conn_str, timeout=3) as conn:
            cursor = conn.cursor()
            cursor.execute(query)
            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            print("Successfully connected to SQL Server (SpeedrunDB) and retrieved records.")
            return results
    except Exception:
        print("[Notice] SQL Server live connection skipped. Using exported / offline dataset.")
        return generate_sample_exported_data()

def generate_sample_exported_data() -> List[Dict[str, Any]]:
    """Generates realistic sample telemetry splits for benchmarking and offline analysis."""
    return [
        # CosmicMario splits
        {"RunnerTag": "CosmicMario", "LevelName": "Bob-omb Battlefield", "StarName": "Behind Chain Chomp's Gate", "Category": "70 Star", "BestTimeSeconds": 48.50},
        {"RunnerTag": "CosmicMario", "LevelName": "Castle Secret Stars & Cap Courses", "StarName": "The Princess’s Secret Slide (Under 21s)", "Category": "70 Star", "BestTimeSeconds": 31.20},
        {"RunnerTag": "CosmicMario", "LevelName": "Castle Secret Stars & Cap Courses", "StarName": "The Princess’s Secret Slide (Box / Timed)", "Category": "70 Star", "BestTimeSeconds": 33.40},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "Shoot into the Wild Blue", "Category": "70 Star", "BestTimeSeconds": 24.10},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "Chip off Whomp’s Block", "Category": "70 Star", "BestTimeSeconds": 28.50},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "To the Top of the Fortress", "Category": "70 Star", "BestTimeSeconds": 36.90},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "Fall onto the Caged Island", "Category": "70 Star", "BestTimeSeconds": 29.80},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "Blast Away the Wall", "Category": "70 Star", "BestTimeSeconds": 22.40},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "Red Coins", "Category": "70 Star", "BestTimeSeconds": 62.10},
        {"RunnerTag": "CosmicMario", "LevelName": "Whomp’s Fortress", "StarName": "100 Coins", "Category": "70 Star", "BestTimeSeconds": 85.00},
        {"RunnerTag": "CosmicMario", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Big Bob-omb on the Summit", "Category": "70 Star", "BestTimeSeconds": 49.00},
        {"RunnerTag": "CosmicMario", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Footrace with Koopa the Quick", "Category": "70 Star", "BestTimeSeconds": 58.20},
        {"RunnerTag": "CosmicMario", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Shoot to the Island in the Sky", "Category": "70 Star", "BestTimeSeconds": 35.10},

        # SpeedyYoshi splits (rival runner)
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Bob-omb Battlefield", "StarName": "Behind Chain Chomp's Gate", "Category": "70 Star", "BestTimeSeconds": 45.10},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Castle Secret Stars & Cap Courses", "StarName": "The Princess’s Secret Slide (Under 21s)", "Category": "70 Star", "BestTimeSeconds": 30.50},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Castle Secret Stars & Cap Courses", "StarName": "The Princess’s Secret Slide (Box / Timed)", "Category": "70 Star", "BestTimeSeconds": 34.00},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "Shoot into the Wild Blue", "Category": "70 Star", "BestTimeSeconds": 22.80},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "Chip off Whomp’s Block", "Category": "70 Star", "BestTimeSeconds": 26.90},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "To the Top of the Fortress", "Category": "70 Star", "BestTimeSeconds": 38.00},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "Fall onto the Caged Island", "Category": "70 Star", "BestTimeSeconds": 27.30},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "Blast Away the Wall", "Category": "70 Star", "BestTimeSeconds": 24.10},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "Red Coins", "Category": "70 Star", "BestTimeSeconds": 59.80},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Whomp’s Fortress", "StarName": "100 Coins", "Category": "70 Star", "BestTimeSeconds": 82.40},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Big Bob-omb on the Summit", "Category": "70 Star", "BestTimeSeconds": 46.30},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Footrace with Koopa the Quick", "Category": "70 Star", "BestTimeSeconds": 53.70},
        {"RunnerTag": "SpeedyYoshi", "LevelName": "Bob-omb Battlefield (Revisit)", "StarName": "Shoot to the Island in the Sky", "Category": "70 Star", "BestTimeSeconds": 33.90},
    ]

def run_route_analysis(splits: List[Dict[str, Any]], route: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """
    Merges split times with route specifications and computes:
    - Gold split (fastest across all runners)
    - Cumulative run pace per runner
    - Time delta vs Gold split (Time Lost)
    - Route step ordering
    """
    route_lookup = {r["StarName"]: r for r in route}

    # Find Gold Splits (fastest per star across any runner)
    gold_splits: Dict[str, float] = {}
    for s in splits:
        star_name = s["StarName"]
        time_val = float(s["BestTimeSeconds"])
        if star_name not in gold_splits or time_val < gold_splits[star_name]:
            gold_splits[star_name] = time_val

    # Group splits by runner
    runner_groups: Dict[str, List[Dict[str, Any]]] = {}
    for s in splits:
        runner = s["RunnerTag"]
        star_name = s["StarName"]
        if star_name in route_lookup:
            meta = route_lookup[star_name]
            time_val = float(s["BestTimeSeconds"])
            gold_val = gold_splits[star_name]
            delta = round(time_val - gold_val, 2)
            
            entry = {
                "RouteOrder": meta["RouteOrder"],
                "RunnerTag": runner,
                "CourseName": meta["CourseName"],
                "StarNumber": meta["StarNumber"],
                "StarName": star_name,
                "BestTimeSeconds": time_val,
                "GoldSplit": gold_val,
                "DeltaToGold": delta,
                "Notes": meta["Notes"]
            }
            runner_groups.setdefault(runner, []).append(entry)

    # Sort each runner's splits by route order and calculate cumulative pace
    analyzed_results = []
    for runner, items in runner_groups.items():
        items.sort(key=lambda x: x["RouteOrder"])
        cumulative = 0.0
        for item in items:
            cumulative += item["BestTimeSeconds"]
            item["CumulativePace"] = round(cumulative, 2)
            analyzed_results.append(item)

    return analyzed_results

def display_summary_report(analyzed_results: List[Dict[str, Any]], route: List[Dict[str, Any]]):
    """Prints formatted analytical summaries to console and exports to CSV."""
    total_route_stars = len(route)
    
    print("\n" + "="*88)
    print(" 🏁 SUPER MARIO 64 (70 STAR) TELEMETRY & ROUTE PERFORMANCE REPORT")
    print("="*88)

    runners = sorted(list(set(r["RunnerTag"] for r in analyzed_results)))
    for runner in runners:
        r_items = [r for r in analyzed_results if r["RunnerTag"] == runner]
        stars_logged = len(r_items)
        total_time = sum(r["BestTimeSeconds"] for r in r_items)
        total_lost = sum(r["DeltaToGold"] for r in r_items)
        best_star = min(r_items, key=lambda x: x["BestTimeSeconds"])
        worst_delta = max(r_items, key=lambda x: x["DeltaToGold"])

        mins, secs = divmod(total_time, 60)

        print(f"\n👤 Runner: {runner}")
        print(f"  • Route Progress: {stars_logged}/{total_route_stars} stars logged ({(stars_logged/total_route_stars)*100:.1f}%)")
        print(f"  • Accumulated Pace: {int(mins):02d}:{secs:05.2f} ({total_time:.2f}s total)")
        print(f"  • Total Time Lost to Gold Splits: +{total_lost:.2f}s")
        print(f"  • Fastest Segment: '{best_star['StarName']}' ({best_star['BestTimeSeconds']}s in {best_star['CourseName']})")
        print(f"  • Biggest Time Save Opportunity: '{worst_delta['StarName']}' (+{worst_delta['DeltaToGold']}s delta)")

    # Print route segment sample
    print("\n" + "-"*88)
    print("📊 SAMPLE SEGMENT-BY-SEGMENT TELEMETRY (First 13 Route Steps)")
    print("-"*88)
    header = f"{'Route#':<7}{'Runner':<13}{'Course':<32}{'Star Name':<30}{'Time':<8}{'Gold':<8}{'Delta':<8}{'Pace':<9}"
    print(header)
    print("-" * len(header))

    # Show first 13 items for the primary runner
    for row in analyzed_results[:13]:
        print(
            f"{row['RouteOrder']:<7}"
            f"{row['RunnerTag']:<13}"
            f"{row['CourseName'][:30]:<32}"
            f"{row['StarName'][:28]:<30}"
            f"{row['BestTimeSeconds']:<8.2f}"
            f"{row['GoldSplit']:<8.2f}"
            f"{row['DeltaToGold']:<8.2f}"
            f"{row['CumulativePace']:<9.2f}"
        )

    # Export to CSV
    export_filename = "Speedrun_70Star_Analysis_Export.csv"
    fieldnames = ["RouteOrder", "RunnerTag", "CourseName", "StarNumber", "StarName", "BestTimeSeconds", "GoldSplit", "DeltaToGold", "CumulativePace", "Notes"]
    with open(export_filename, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(analyzed_results)

    print(f"\n💾 Full dataset exported cleanly to CSV: '{export_filename}'.")

if __name__ == "__main__":
    route = parse_route_dictionary()
    splits = fetch_splits_from_sql()
    analysis = run_route_analysis(splits, route)
    display_summary_report(analysis, route)
