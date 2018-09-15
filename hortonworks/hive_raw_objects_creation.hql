create schema flight_performance;

-- create external table for airports
create external table raw_airports (
    iata string, 
    airport string, 
    city string,
    state string, 
    country string, 
    geolat float, 
    geolong float
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
) 
location '/user/maria_dev/raw/flight_performance/airports';


-- create external table for carriers
create external table raw_carriers (
    code varchar(4), 
    description varchar(30)
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/maria_dev/raw/flight_performance/carriers';

-- create external table for plane information
create external table raw_planes (
    tailnum varchar(4), 
    type varchar(30),
    manufacturer string,
    issue_date varchar(16), 
    model varchar(10), 
    status varchar(10),
    aircraft_type varchar(30),
    pyear int
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)  
stored as textfile
location '/user/maria_dev/raw/flight_performance/planes';


create external table raw_flights
  (year smallint, month tinyint, dayofmonth tinyint,dayofweek tinyint,
  deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
  uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
  crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
  origin string, dest string, distance smallint, taxiin string, taxiout string,
  cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
  weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
row format delimited
fields terminated by ','
location '/user/maria_dev/raw/flight_performance/flights';
