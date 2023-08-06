# when this bash file is triggered it downloads all of the files from the website

#!/bin/bash

# URL = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02"

# loop through the years from 1960 to 2023

for year in {1960..2023}; do

    for month in {1..12}; do

        month_padded=$(printf "%02d" $month)

        next_month=$((month + 1))

        if [ $month -eq 12 ]; then
            next_month=1
            next_year=$((year + 1))
        else
            next_year=$year
        fi

        next_month_padded=$(printf "%02d" $next_month)

        url="https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=${year}-${month_padded}-01&endtime=${next_year}-${next_month_padded}-01"

        wget $url

    done

done

