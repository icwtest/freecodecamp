#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ -z $1 ]
then
  echo Please provide an element as an argument.
else
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    FIND_ATOMIC_NUMBER=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, p. melting_point_celsius, p.boiling_point_celsius, t.type from elements e inner join properties p on e.atomic_number = p.atomic_number inner join types t on p.type_id = t.type_id where e.atomic_number = $1;")
    if [[ -z $FIND_ATOMIC_NUMBER ]]
    then
      echo I could not find that element in the database.
    else
      IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$FIND_ATOMIC_NUMBER"
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  elif   [[ "$1" =~ ^[a-zA-Z]{1,2}$ ]]
  then
    FIND_SYMBOL=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, p. melting_point_celsius, p.boiling_point_celsius, t.type from elements e inner join properties p on e.atomic_number = p.atomic_number inner join types t on p.type_id = t.type_id where lower(e.symbol) = lower('$1');")
    if [[ -z $FIND_SYMBOL ]]
    then
      echo I could not find that element in the database.
    else
      IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$FIND_SYMBOL"
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  else
    FIND_NAME=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, p. melting_point_celsius, p.boiling_point_celsius, t.type from elements e inner join properties p on e.atomic_number = p.atomic_number inner join types t on p.type_id = t.type_id where lower(e.name) = lower('$1');")
    if [[ -z $FIND_NAME ]]
    then
      echo I could not find that element in the database.
    else
      IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$FIND_NAME"
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  fi
fi