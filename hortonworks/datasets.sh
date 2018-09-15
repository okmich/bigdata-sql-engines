# Airline on-time performance dataset from 2004 to 2008 (6 zipped files)
# ======================================================================
wget http://stat-computing.org/dataexpo/2009/2001.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2002.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2003.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2004.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2005.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2006.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2007.csv.bz2
wget http://stat-computing.org/dataexpo/2009/2008.csv.bz2

hdfs dfs -mkdir -p ./raw/flight_performance/flights

# I had a problem using tar command, so I installed bzip2 utility
# yum install bzip2 

bzip2 -d 2001.csv.bz2
bzip2 -d 2002.csv.bz2
bzip2 -d 2003.csv.bz2
bzip2 -d 2004.csv.bz2
bzip2 -d 2005.csv.bz2
bzip2 -d 2006.csv.bz2
bzip2 -d 2007.csv.bz2
bzip2 -d 2008.csv.bz2
		
hdfs dfs -moveFromLocal 2001.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2002.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2003.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2004.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2005.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2006.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2007.csv ./raw/flight_performance/flights
hdfs dfs -moveFromLocal 2008.csv ./raw/flight_performance/flights

# Supplementary data
# ==========================
wget http://stat-computing.org/dataexpo/2009/airports.csv
wget http://stat-computing.org/dataexpo/2009/carriers.csv
wget http://stat-computing.org/dataexpo/2009/plane-data.csv

hdfs dfs -mkdir -p ./raw/flight_performance/airports
hdfs dfs -mkdir -p ./raw/flight_performance/carriers
hdfs dfs -mkdir -p ./raw/flight_performance/plane_data

hdfs dfs -moveFromLocal airports.csv	./raw/flight_performance/airports
hdfs dfs -moveFromLocal carriers.csv	./raw/flight_performance/carriers
hdfs dfs -moveFromLocal plane-data.csv	./raw/flight_performance/plane_data