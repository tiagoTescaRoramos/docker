#!/usr/bin/env bash
./up.sh
echo "Database name: "
read database;

echo "Password to access database:"
read password;

echo "What's name file?"
read file;

if ! test -f "dumps/$file"; then
  echo "File name not exist";
elif [ $database != '' ]; then
  echo "CREATE DATABASE IF NOT EXISTS $database;" >> dumps/createdatabase.sql
  if docker exec -i mysql mysql -u root -p$password < dumps/createdatabase.sql &&
    docker exec -i mysql mysql -u root -p$password $database < "dumps/$file"; then
      rm dumps/*.sql;
      echo "Restore finish.";
  else
    echo "Problem with restore";
  fi
else
  echo "Database empty."
fi