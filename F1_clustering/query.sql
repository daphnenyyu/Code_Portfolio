WITH driver_race_stats AS (
    SELECT 
        r.driverId,
        r.raceId,
        r.grid,
        r.position AS finish_position,
        r.points,
        q.position AS quali_position,
        r.constructorId,
        r.fastestLapTime, 
        RANK() OVER(PARTITION BY q.raceId, q.constructorId ORDER BY q.position DESC) - 1 AS out_qualify_teammate, 
        CASE 
            WHEN COUNT(r.position) OVER (PARTITION BY r.raceId, r.constructorId) = 2
            THEN RANK() OVER(PARTITION BY r.raceId, r.constructorId ORDER BY r.position DESC) - 1 
            WHEN COUNT(r.position) OVER (PARTITION BY r.raceId, r.constructorId) = 1
                AND r.position IS NOT NULL
            THEN 1
            WHEN COUNT(r.position) OVER (PARTITION BY r.raceId, r.constructorId) = 1
                AND r.position IS NULL
            THEN 0
            ELSE NULL
        END AS out_perform_teammate, 
        CASE 
            WHEN r.grid IS NOT NULL AND r.position IS NOT NULL
                THEN r.grid - r.position 
            WHEN r.grid IS NULL AND r.position IS NOT NULL
                THEN 0
            WHEN r.grid IS NOT NULL AND r.position IS NULL
                THEN r.grid
            ELSE NULL
        END AS position_delta, 
        CASE 
            WHEN r.position IS NULL THEN 1
            ELSE 0
        END AS no_result, 
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
    AVG(drs.quali_position) AS avg_qualifying_position,
    AVG(drs.points) AS avg_points,
    AVG(position_delta) AS avg_position_delta,
    AVG(out_qualify_teammate) AS out_qualify_percent, 
    AVG(out_perform_teammate) AS out_perform_percent,
    AVG(no_result) AS no_result_percent, 
FROM driver_race_stats drs
LEFT JOIN drivers d ON drs.driverId = d.driverId
JOIN lap_times lt ON drs.driverId = lt.driverId
GROUP BY d.driverId, driver_name
HAVING races_count > 1
ORDER BY d.driverId