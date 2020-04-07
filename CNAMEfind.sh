#!/bin/bash

domain=$1
while read sub; do 
	CNAME=$(host -t CNAME $sub.$domain | grep 'is an alias' | awk '{print $6}')
	
	if [ -z "$CNAME" ]; then
		continue
	fi 
	
	if (! host $CNAME) &> /dev/null; then 
		echo "The $CNAME doesn't resolves to $sub.$domain";
	fi
done

echo "completed!"
