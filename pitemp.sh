#!/bin/bash


CPU=$(/opt/vc/bin/vcgencmd measure_temp | tr -cd '0-9.')
 
curl -i -XPOST 'http://localhost:8086/write?db=pitemp' --data-binary 'temperature CPU='$CPU

