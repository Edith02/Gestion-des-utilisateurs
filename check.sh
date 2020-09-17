#! /bin/bash
xls2csv list.xls > converted.csv

imput="/home/Documents/Gestion-des-utilisateurs/converted.csv"
array=($(awk -F: '{print $1}' /ect/passwd))
i=0;

while IFS = read -r line

	i=0
	for item in ${array [*]}
	do

		if ["$line" = "\"$item\""]; then
			i=$((i+1))
		fi

	done
	if [ "$i" = 0 ]; then
		useradd $line
		mkhomedir_helper $line
	fi
done < "$input"
