#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?"

SERVICES_MENU() {
  AVAILABLE_SERVICES=$($PSQL "select service_id, name from services order by service_id;")

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  if [[ -z $AVAILABLE_SERVICES ]]
  then
  echo -e "\nI'm sorry there are no available services at this time."
  else
    echo -e "\nHere are the available services:" 
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
  fi
  
  echo -e "\nWhich service would you like?"
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
  then
    # send to main menu
    SERVICES_MENU "I could not find that service. Which service would you like?"
  else
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services where service_id = $SERVICE_ID_SELECTED;")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
    fi

    
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME

    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED);")

    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICES_MENU