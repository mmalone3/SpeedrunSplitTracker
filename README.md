# ⚡ Speedrun Split & Telemetry API

> An ASP.NET Core REST API backed by SQL Server stored procedures with an integrated dark-themed telemetry dashboard for recording, aggregating, and comparing speedrun star splits and personal bests (PBs).

[![.NET Version](https://img.shields.io/badge/.NET-10.0%20%2F%208.0+-512BD4?logo=dotnet&logoColor=white)](https://dotnet.microsoft.com/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2022%20%2F%202025-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![API Testing](https://img.shields.io/badge/API-Postman%20%26%20OpenAPI-FF6C37?logo=postman&logoColor=white)](https://www.postman.com/)

---

## 📌 Project Overview

The **Speedrun Split & Telemetry API** is a full-stack backend service and telemetry dashboard designed to record, aggregate, and analyze competitive speedrun splits (such as *Super Mario 64* star courses).

Built to replace flat-file timers with structured relational persistence, the service delegates heavy analytical computations (total accumulated run times, fastest segment identification, and dynamic category leaderboards) directly to **SQL Server Stored Procedures**, exposing clean RESTful endpoints through an **ASP.NET Core** Web API and an integrated interactive web UI.

---

## 🌟 Key Highlights & Architecture

* **Database-Driven Analytical Engine:** Leverages SQL Server compiled stored procedures (`sp_GetCategoryLeaderboard`, `sp_GetRunnerSplits`, `sp_UpsertStarTime`) executing multi-table joins and aggregations (`SUM`, `MIN`, `COUNT`, `GROUP BY`).
* **Sub-Second Segment Precision:** Captures and serializes high-precision split timing via `DECIMAL(7, 2)` column precision mapped directly to strongly typed C# DTOs.
* **Resilient ADO.NET Data Layer:** Implements `Microsoft.Data.SqlClient` using asynchronous connection/reader patterns, parameterized SQL queries to prevent injection attacks, and strict lifecycle disposal.
* **Interactive Single-Page UI (LiveSplit Aesthetic):** Built-in dark-themed dashboard served directly via static ASP.NET Core middleware, featuring live PB submissions, category switching (*16 Star*, *70 Star*, *120 Star*), and instant recalculation without external UI framework dependencies.
* **OpenAPI & Postman Ready:** Clean REST endpoints configured for rapid validation and HTTP response testing.

---

## 🛠️ Tech Stack & Prerequisites

* **Backend:** C# / .NET 10 (or .NET 8+) ASP.NET Core Web API
* **Data Access:** ADO.NET (`Microsoft.Data.SqlClient` 7.0+)
* **Database:** Microsoft SQL Server (Local, Developer, or Express)
* **Frontend:** HTML5, CSS3 (Dark Mode / LiveSplit Theme), Vanilla JavaScript Fetch API
* **API Testing:** Postman, OpenAPI / Swagger

---

## 📦 Getting Started

### 1. Database Setup
1. Open **SQL Server Management Studio (SSMS)** or **VS Code SQL Tools**.
2. Connect to your local SQL Server instance (`localhost`).
3. Open and execute the bundled script:
   ```text
   Database/schema.sql
   ```
   *This initializes the `SpeedrunDB` database, tables (`Levels`, `Stars`, `Runners`, `StarSplits`), stored procedures, and sample seed data.*

### 2. Verify Connection String
Check `appsettings.json` in the project root:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=SpeedrunDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
```

### 3. Run the Application
In your terminal, navigate to the project directory and run:

```powershell
Set-Location "SpeedrunSplitTracker"
dotnet run
```

### 4. Launch the Dashboard
Open your web browser and navigate to:
```text
http://localhost:5000   (or https://localhost:7xxx as displayed in your terminal output)
```

---

## 🎮 How to Use the App for Your Own Times

1. **Select a Category:** Choose from *70 Star*, *16 Star*, or *120 Star*.
2. **Enter Your Runner Tag:** Type your username/gamertag (e.g. `YourName`).
3. **Log a Split Time:**
   * Select the course/star mission from the dropdown (e.g., *Big Bob-omb on the Summit*).
   * Enter your split time in seconds (e.g., `0.49` or `34.15`).
   * Click **💾 Save Split & Recalculate**.
4. **Inspect Live Metrics:**
   * **Category Leaderboard:** Recalculates your total accumulated run time, stars completed, and overall best segment.
   * **Segment Breakdown:** Displays course names, star numbers, individual best splits, and update timestamps.

---

## 📡 REST API Endpoints

| Method | Endpoint | Query / Body Params | Description |
| :--- | :--- | :--- | :--- |
| **GET** | `/api/speedrun/leaderboard` | `?category=70 Star` | Returns overall leaderboard summary by category. |
| **GET** | `/api/speedrun/splits` | `?runnerTag=CosmicMario&category=70 Star` | Returns list of star splits for a specific runner. |
| **POST** | `/api/speedrun/updatetime` | `{"runnerTag":"Name", "starName":"Star", "category":"70 Star", "timeSeconds": 0.49}` | Upserts/logs a new star PB time in the database. |

### Sample JSON Response (`GET /api/speedrun/leaderboard`)
```json
[
  {
    "runnerTag": "SpeedyYoshi",
    "category": "70 Star",
    "starsCompleted": 3,
    "totalRunTimeSeconds": 1.35,
    "fastestStarSeconds": 0.39
  },
  {
    "runnerTag": "CosmicMario",
    "category": "70 Star",
    "starsCompleted": 3,
    "totalRunTimeSeconds": 1.49,
    "fastestStarSeconds": 0.42
  }
]
```

---

## � Python Route Analytics & SQL Telemetry Engine (Option 1 Implementation)

The project includes an external Python telemetry engine that bridges relational database persistence with route strategy graph dictionaries (`sm64_70_star_route` in [pythondictionarySM64.py](pythondictionarySM64.py)):

* **Route Integration Engine ([split_analysis.py](split_analysis.py)):** Ingests database splits, calculates segment ordering, identifies **Community Gold Splits** (fastest theoretical segment across all runners), computes accumulated pace, and highlights top time-save opportunities.
* **Auto Route Seed Generator ([Database/seed_70star_route.sql](Database/seed_70star_route.sql)):** Generated via [generate_seed_sql.py](generate_seed_sql.py) to automatically populate all courses and star missions from the route dictionary into `dbo.Levels` and `dbo.Stars`.
* **Telemetry CSV Export:** Automatically outputs [Speedrun_70Star_Analysis_Export.csv](Speedrun_70Star_Analysis_Export.csv) for external visualization and analytics.

### Running the Python Engine
```powershell
python split_analysis.py
```

---

## 📂 Project Structure

```text
SpeedrunSplitTracker/
├── Controllers/
│   └── SpeedrunController.cs          # REST API Controller executing SQL Stored Procedures
├── Database/
│   ├── schema.sql                     # Full SQL schema, procedures, and core seed datasets
│   └── seed_70star_route.sql          # Complete 70-star route seed generated from Python
├── Models/
│   └── SpeedrunModels.cs              # Strongly typed C# DTO contracts
├── pythondictionarySM64.py            # SM64 70-Star speedrun route definition
├── split_analysis.py                  # Python split analysis, gold splits & pacing engine
├── generate_seed_sql.py               # Generates SQL seed script from Python dictionary
├── Speedrun_70Star_Analysis_Export.csv # Generated analytical export dataset
├── wwwroot/
│   └── index.html                     # Live interactive dark-mode dashboard
├── appsettings.json                   # Connection strings and environment config
├── Program.cs                         # Application startup, routing & static file middleware
└── README.md                          # Complete project documentation and guide
```

---

## 📄 Resume Alignment

* **Speedrun Split & Telemetry API — C#, ASP.NET Core, SQL Server, Postman, JavaScript**
  * Architected an ASP.NET Core REST API delivering sub-second speedrun telemetry and leaderboard aggregations by designing optimized SQL Server stored procedures with multi-table joins and analytical functions (`SUM`, `MIN`, `COUNT`, `GROUP BY`).
  * Developed an ADO.NET data access layer using `Microsoft.Data.SqlClient` and strongly typed DTO contracts to serialize segment timing metrics into structured JSON payloads validated via Postman and OpenAPI/Swagger.
  * Engineered an integrated, dark-themed single-page dashboard allowing real-time personal best (PB) logging, dynamic split calculation, and instant course-by-course segment breakdown.
  * Applied iterative AI-assisted workflow reviews to refine API contracts, enforce parameterized SQL security, and optimize connection lifecycle management.
