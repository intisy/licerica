#!/bin/bash

MAX_RETRIES=100
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
  git push origin main
  if [ $? -eq 0 ]; then
    echo "Push successful!"
    break
  else
    echo "Push failed, retrying... ($((COUNT+1))/$MAX_RETRIES)"
    COUNT=$((COUNT+1))
    sleep 5
  fi
done

if [ $COUNT -eq $MAX_RETRIES ]; then
  echo "Push failed after $MAX_RETRIES attempts."
fi
read -p "Press Enter to exit..."