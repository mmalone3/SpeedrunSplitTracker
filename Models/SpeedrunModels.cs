namespace SpeedrunSplitTracker.Models;

public class CategoryLeaderboardSummary
{
    public string RunnerTag { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty;
    public int StarsCompleted { get; set; }
    public decimal TotalRunTimeSeconds { get; set; }
    public decimal FastestStarSeconds { get; set; }
}

public class RunnerStarSplit
{
    public string LevelName { get; set; } = string.Empty;
    public int CourseNumber { get; set; }
    public int StarNumber { get; set; }
    public string StarName { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty;
    public decimal BestTimeSeconds { get; set; }
    public DateTime LastUpdated { get; set; }
}

public class UpdateStarTimeRequest
{
    public string RunnerTag { get; set; } = string.Empty;
    public string StarName { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty;
    public decimal TimeSeconds { get; set; }
}
