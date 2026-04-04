SELECT * FROM CityAnalysis;

SELECT 
    CitySize,
    COUNT(*) AS NumberOfCities,
    SUM(Total) AS TotalEmployment
FROM CityAnalysis
GROUP BY CitySize;

SELECT 
    city,
    Total,
    ROUND(100.0 * Total / CAST(SUM(Total) OVER () AS FLOAT), 2) AS SharePercentage
FROM CleanCities
ORDER BY Total DESC;

SELECT TOP 10
    city,
    Total
FROM CleanCities
ORDER BY Total DESC;

SELECT 
    city,
    Total,
    SUM(Total) OVER (
        ORDER BY Total DESC, city
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sum,
    ROUND(
        100.0 * SUM(Total) OVER (
            ORDER BY Total DESC, city
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) / CAST(SUM(Total) OVER () AS FLOAT),
        2
    ) AS cumulative_percentage
FROM CleanCities
ORDER BY Total DESC, city;