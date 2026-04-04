CREATE OR ALTER VIEW CityAnalysis AS
SELECT 
    city,
    Total,
    CASE 
        WHEN Total > 1000000 THEN 'Mega City'
        WHEN Total > 500000 THEN 'Large City'
        WHEN Total > 100000 THEN 'Medium City'
        ELSE 'Small City'
    END AS CitySize
FROM CleanCities;