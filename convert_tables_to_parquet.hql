use flight_performance;

create table pk_airports 
stored as parquet
as
select * from raw_airports where iata <> 'iata';

create table pk_carriers 
stored as parquet
as
select * from raw_carriers where code <> 'code';


create table pk_planes 
stored as parquet
as
select * from raw_planes where tailnum <> 'tailnum';

create external table pk_flight
  (year smallint, month tinyint, dayofmonth tinyint,dayofweek tinyint,
  deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
  uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
  crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
  origin string, dest string, distance smallint, taxiin string, taxiout string,
  cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
  weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
stored as parquet;

insert overwrite table pk_flight
	select cast(year as smallint), 
	cast(month as tinyint), 
	cast(dayofmonth as tinyint), 
	cast(dayofweek as tinyint), 
	cast(deptime as smallint), 
	cast(crsdeptime as smallint), 
	cast(arrtime as smallint), 
	cast(crsarrtime as smallint),
	uniquecarrier, flightnum, tailnum, 
	cast(actualelapsedtime as smallint), 
	cast(crselapsedtime as smallint), 
	cast(airtime as smallint), 
	cast(arrdelay as smallint), 
	cast(depdelay as smallint), 
	origin, dest, 
	cast(distance as smallint), 
	taxiin, taxiout, cancelled, cancellationcode, diverted, 
	cast(carrierdelay as smallint), 
	cast(weatherdelay as smallint), 
	cast(nasdelay as smallint), 
	cast(securitydelay as smallint),
	cast(lateaircraftdelay as smallint)
from raw_flight where taxiin <> 'taxiin';



