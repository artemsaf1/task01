#!/bin/bash

mkdir key

touch key/file{1..300}

for i in {1..60}
do
    echo $((RANDOM%10 + 1)) > key/part${i}.key
done

echo "Generation completed"

FILES=key/*
KEY=0

for file in $FILES
do
    if [[ $file =~ \.key$ ]]
    then
        tmp=$(< $file)
        KEY=$(($KEY + $tmp))
    else
        KEY=1
        break
    fi
done

if [ $KEY == 0 ]
then
    echo "Error."
else
    echo "Ok."
    echo $(($KEY*2)) > main.key
fi

sleep 1
mv key ai_help
mv main.key ai_help

