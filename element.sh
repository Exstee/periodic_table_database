#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ELEMENT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number::text='$1' OR symbol='$1' OR name='$1';")

if [[ -z "$ELEMENT" ]]; then
  echo "I could not find that element in the database."
  exit
fi