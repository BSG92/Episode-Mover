#!/usr/bin/bash

#EPISODE_LIST=()
echo "Enter two patterns to match, each separated by a comma"
read -p '> ' PAT1 PAT2
#echo "Enter 2 exclude patterns separated by a comma"
#read -p "> " EX_PAT1 EX_PAT2

echo "Enter Directory Name"
read -p "> " DIR_NAME

#echo "Looking for Pattern --> $PAT1*$PAT2*"
EPISODE_LIST=$(find . -maxdepth 1 -type f -name "$PAT1*$PAT2*")
EPISODE_ITEM=0

#if [ "$PAT1" = "" ]; then
#	exit 1
#fi

# Check if variables are unset and act accordingly
# if [ ! -z ${EX_PAT1} ]; then

# If EPISODE_LIST is empty; then exit
# Если EPISODE_LIST - пустой, тогда выйти
if [ ${#EPISODE_LIST[@]} -eq 0 ]; then
	echo "List is empty. Exiting..."
	exit 0
else
	if [ ! -d "$(pwd)/$DIR_NAME" ]; then
		mkdir "$(pwd)/$DIR_NAME"
		if [ $? -eq 0 ]; then
			echo "Directory $DIR_NAME Created"
		fi
	else
		echo "$DIR_NAME already exists"
	fi
fi

for i in ${EPISODE_LIST[@]}; do
	echo "Moving $EPISODE_ITEM: $i"
	mv "$i" "$(pwd)/$DIR_NAME/"
	if [ $? -eq 0 ]; then
		echo "   Done"
	else
		echo "   Error Moving"
	fi
	((EPISODE_ITEM=EPISODE_ITEM+1))
done
