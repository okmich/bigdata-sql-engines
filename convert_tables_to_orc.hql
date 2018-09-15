use flight_performance;

create table airports 
stored as orc
as
select * from raw_airports where iata <> 'iata';

create table carriers 
stored as orc
as
select * from raw_carriers where code <> 'code';


create table planes 
stored as orc
as
select * from raw_planes where tailnum <> 'tailnum';

create external table flight
  (year smallint, month tinyint, dayofmonth tinyint,dayofweek tinyint,
  deptime smallint, crsdeptime smallint, arrtime smallint, crsarrtime smallint, 
  uniquecarrier string, flightnum string, tailnum string, actualelapsedtime smallint,
  crselapsedtime smallint, airtime smallint, arrdelay smallint, depdelay smallint, 
  origin string, dest string, distance smallint, taxiin string, taxiout string,
  cancelled string, cancellationcode string, diverted string, carrierdelay smallint,
  weatherdelay smallint, nasdelay smallint, securitydelay smallint, lateaircraftdelay smallint)
stored as orc;
