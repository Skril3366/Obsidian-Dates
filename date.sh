#! /bin/bash

MONTHS(){
	case "$1" in
	01)
		echo "January" ;;
	02)
		echo "February" ;;
	03)
		echo "March" ;;
	04)
		echo "April" ;;
	05)
		echo "May" ;;
	06)
		echo "June" ;;
	07)
		echo "July" ;;
	08)
		echo "August" ;;
	09)
		echo "September" ;;
	10)
		echo "October" ;;
	11)
		echo "November" ;;
	12)
		echo "December" ;;
	esac
}

cd ~/Documents/Obsidian/General

echo "---
type: MOC
---

links: [[000 Index | Index]]

---"

LINES=$(fd |ggrep -P "\d{4}-\d{2}-\d{2}\.md" | sed "s/.*\///g; s/\.md//g")

PREW_YEAR="YEAR"
PREW_MONTH="MONTH"

for LINE in $LINES
do
	MONTH_DIGIT=$(echo $LINE | cut -b 6,7)
	DATE=$(echo $LINE | cut -b 9,10)
	YEAR=$(echo $LINE | cut -b 1-4)
	MONTH=$(MONTHS $MONTH_DIGIT)

if [ $PREW_YEAR != $YEAR ]
then
		echo "
## $YEAR"
fi


if [ $PREW_MONTH != $MONTH ]
then
		echo "
### $MONTH
		"
fi
	echo "- [[$LINE | $MONTH $DATE, $YEAR]]"


	PREW_YEAR=$YEAR
	PREW_MONTH=$MONTH
done
