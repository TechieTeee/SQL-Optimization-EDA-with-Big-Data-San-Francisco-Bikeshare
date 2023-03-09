--Stations w/ Most Bike Trips
--Organize by Short Names
--In the Month of March 2018
SELECT subquery.short_name, subquery.count, station_info.short_name
FROM (
  SELECT short_name, COUNT(*) as count
  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` trips
  JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` station_info
  ON trips.start_station_name = station_info.name
  WHERE start_date >= '2018-03-01' AND start_date < '2018-03-31'
  GROUP BY short_name
  ORDER BY COUNT(*) DESC
  LIMIT 5
) as subquery
JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` station_info
ON subquery.short_name = station_info.short_name;


--Stations w/ the Most Destination
--Organize by Short Names
--In the Month of March 2018
SELECT subquery.short_name, subquery.count, station_info.short_name
FROM (
  SELECT short_name, COUNT(*) as count
  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` trips
  JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` station_info
  ON trips.end_station_name = station_info.name
  WHERE start_date >= '2018-03-01' AND start_date < '2018-03-31'
  GROUP BY short_name
  ORDER BY COUNT(*) DESC
  LIMIT 5
) as subquery
JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` station_info
ON subquery.short_name = station_info.short_name;


--Average Age of Bike Riders
--In the Month of March 2018
SELECT AVG(2018 - member_birth_year)
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips`
WHERE start_date >= '2018-03-01' AND start_date < '2018-03-31';


--Most Common Journey
--AKA Most Commom Combination of Start and End Destinations
--In the Month of March 2018
SELECT
  start_station_id,
  end_station_id,
  start_station_name,
  end_station_name,
  COUNT(*) AS Trips
FROM
  `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips`
WHERE
  (start_station_id != end_station_id)
AND
start_date >= '2018-03-01' AND start_date < '2018-03-31'
GROUP BY
  start_station_id,
  end_station_id,
  start_station_name,
  end_station_name
ORDER BY
  Trips DESC
LIMIT
  1;

--Busiest Hour of the Day
--In the Month of March 2018
  SELECT EXTRACT(HOUR FROM start_date) AS hour, COUNT(*) AS count
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips`
WHERE start_date >= '2018-03-01' AND start_date < '2018-03-31'
GROUP BY hour
ORDER BY count DESC
LIMIT 5;
  

