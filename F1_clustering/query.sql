WITH driver_race_stats AS (
    SELECT 
        r.driverId,
        r.raceId,
        r.grid,
        r.positionOrder AS finish_position,
        r.points,
        q.position AS quali_position,
        CASE 
            WHEN r.fastestLapSpeed NOT IN ('\N', '') THEN 
                CAST(SPLIT_PART(r.fastestLapTime, ':', 1) AS INT) * 60000 +  
                CAST(SPLIT_PART(r.fastestLapTime, ':', 2) AS DOUBLE) * 1000  
            ELSE NULL
        END AS fastest_lap_time_in_ms
    FROM results r
    LEFT JOIN qualifying q ON r.driverId = q.driverId AND r.raceId = q.raceId
    LEFT JOIN races ON q.raceId = races.raceId
    WHERE races.year >= 2005 
)

SELECT 
    d.driverId,
    d.forename || ' ' || d.surname AS driver_name,
    COUNT(DISTINCT drs.raceId) AS races_count,
    AVG(drs.finish_position) AS avg_finish_position,
    STDDEV(drs.finish_position) AS finish_stddev,
    AVG(drs.quali_position) AS avg_qualifying_position,
    AVG(drs.points) AS avg_points,
    AVG(drs.grid) AS avg_grid_position,
    AVG(CASE 
          WHEN drs.grid IS NOT NULL AND drs.finish_position IS NOT NULL 
          THEN CASE WHEN drs.finish_position < drs.grid THEN 1 ELSE 0 END
          ELSE NULL
        END) AS improvement_rate,
    AVG(drs.fastest_lap_time_in_ms) AS avg_fastest_lap_time_in_ms
FROM driver_race_stats drs
JOIN drivers d ON drs.driverId = d.driverId
GROUP BY d.driverId, driver_name