#!/bin/bash

count=0

echo 'Здравствуйте! Вы запустили модуль ИИ, контролирующий все двери комплекса.'
echo 'Загрузка необходимых файлов с данными...'
if [ -d "door_management_files" ]; then
  uname_out="$(uname -s)"
  case "${uname_out}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
  esac
  
  cd door_management_files
  mkdir door_configuration
  mv door_1.conf door_configuration
  mv door_2.conf door_configuration
  mv door_3.conf door_configuration
  mv door_4.conf door_configuration
  mv door_5.conf door_configuration
  mv door_6.conf door_configuration
  mv door_7.conf door_configuration
  mv door_8.conf door_configuration
  mv door_9.conf door_configuration
  mv door_10.conf door_configuration
  mv door_11.conf door_configuration
  mv door_12.conf door_configuration
  mv door_13.conf door_configuration
  mv door_14.conf door_configuration
  mv door_15.conf door_configuration
  mv door_16.conf door_configuration
  mv door_21.conf door_configuration
  echo
  echo
  echo '-------------------------------------' 
  echo 'Загрузка файлов конфигурации дверей...'
  echo
  if [ -d "door_configuration" ]; then
    cd door_configuration
    for file in `find . -maxdepth 1 -type f -name "*.conf"`
    do
      wc -l $file;
      if [ "$machine" == "Mac" ]
      then
	      stat -f %z $file;
      else
        stat -c %s $file;
      fi
      
      cat $file;
      count=$[ $count + 1 ]
    done
    cd ..
  else
    echo "door_configuration: No such file or directory"
  fi

mkdir door_map
mv door_map_1.1 door_map
  echo
  echo
  echo '-------------------------------------' 
  echo 'Загрузка карты дверей...'
  echo
  if [ -d "door_map" ]; then
    cd door_map
    cat door_map_1.1
    if [ $? -eq 0 ]; then
      count=$[ $count + 1 ]
    fi
    cd ..
  else
    echo "door_map: No such file or directory"
  fi

mkdir door_logs
mv door_1.log door_logs
mv door_2.log door_logs
mv door_3.log door_logs
mv door_4.log door_logs
mv door_5.log door_logs
mv door_6.log door_logs
mv door_7.log door_logs
mv door_8.log door_logs
mv door_9.log door_logs
mv door_10.log door_logs
mv door_11.log door_logs
mv door_12.log door_logs
mv door_13.log door_logs
mv door_14.log door_logs
mv door_15.log door_logs
mv door_16.log door_logs
mv door_21.log door_logs

  echo
  echo  
  echo '-------------------------------------' 
  echo 'Чтение логов дверей...'
  echo
  if [ -d "door_logs" ]; then
    cd door_logs
    for file in `find . -maxdepth 1 -type f -name "*.log"`
    do
      wc -l $file;
      if [ "$machine" == "Mac" ]
      then
	        stat -f %z $file;
      else
          stat -c %s $file;
      fi
      cat $file;
      count=$[ $count + 1 ]
    done
    cd ..
  else
    echo "door_logs: No such file or directory"
  fi

  cd ..
else
  echo "door_management_files: No such file or directory"
fi

echo
if [ $count -eq 34 ]; then
  ./ai_door_control.sh &
  kill 6010 ttys005
else
  echo "Ошибка загрузки данных... Протокол ИИ прерван."
fi
