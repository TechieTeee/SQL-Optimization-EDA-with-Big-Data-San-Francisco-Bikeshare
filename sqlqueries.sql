--Stations w/ Most Bike Trips
--Organize by Short Names
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

