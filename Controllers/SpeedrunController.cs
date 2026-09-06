using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using SpeedrunSplitTracker.Models;
using System.Data;

namespace SpeedrunSplitTracker.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SpeedrunController : ControllerBase
{
    private readonly string _connectionString;

    public SpeedrunController(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection")
            ?? throw new InvalidOperationException("DefaultConnection not found.");
    }

    [HttpGet("leaderboard")]
    public async Task<ActionResult<IEnumerable<CategoryLeaderboardSummary>>> GetLeaderboard([FromQuery] string category = "70 Star")
    {
        var list = new List<CategoryLeaderboardSummary>();
        using var conn = new SqlConnection(_connectionString);
        using var cmd = new SqlCommand("dbo.sp_GetCategoryLeaderboard", conn)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@Category", category);

        await conn.OpenAsync();
        using var reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            list.Add(new CategoryLeaderboardSummary
            {
                RunnerTag = reader.GetString(reader.GetOrdinal("RunnerTag")),
                Category = reader.GetString(reader.GetOrdinal("Category")),
                StarsCompleted = reader.GetInt32(reader.GetOrdinal("StarsCompleted")),
                TotalRunTimeSeconds = reader.GetDecimal(reader.GetOrdinal("TotalRunTimeSeconds")),
                FastestStarSeconds = reader.GetDecimal(reader.GetOrdinal("FastestStarSeconds"))
            });
        }
        return Ok(list);
    }

    [HttpGet("splits")]
    public async Task<ActionResult<IEnumerable<RunnerStarSplit>>> GetRunnerSplits([FromQuery] string runnerTag, [FromQuery] string category = "70 Star")
    {
        var list = new List<RunnerStarSplit>();
        using var conn = new SqlConnection(_connectionString);
        using var cmd = new SqlCommand("dbo.sp_GetRunnerSplits", conn)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@RunnerTag", runnerTag);
        cmd.Parameters.AddWithValue("@Category", category);

        await conn.OpenAsync();
        using var reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            list.Add(new RunnerStarSplit
            {
                LevelName = reader.GetString(reader.GetOrdinal("LevelName")),
                CourseNumber = reader.GetInt32(reader.GetOrdinal("CourseNumber")),
                StarNumber = reader.GetInt32(reader.GetOrdinal("StarNumber")),
                StarName = reader.GetString(reader.GetOrdinal("StarName")),
                Category = reader.GetString(reader.GetOrdinal("Category")),
                BestTimeSeconds = reader.GetDecimal(reader.GetOrdinal("BestTimeSeconds")),
                LastUpdated = reader.GetDateTime(reader.GetOrdinal("LastUpdated"))
            });
        }
        return Ok(list);
    }

    [HttpPost("updatetime")]
    public async Task<IActionResult> UpdateStarTime([FromBody] UpdateStarTimeRequest request)
    {
        using var conn = new SqlConnection(_connectionString);
        using var cmd = new SqlCommand("dbo.sp_UpsertStarTime", conn)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@RunnerTag", request.RunnerTag);
        cmd.Parameters.AddWithValue("@StarName", request.StarName);
        cmd.Parameters.AddWithValue("@Category", request.Category);
        cmd.Parameters.AddWithValue("@TimeSeconds", request.TimeSeconds);

        await conn.OpenAsync();
        await cmd.ExecuteNonQueryAsync();

        return Ok(new { message = "Time updated successfully!" });
    }
}
