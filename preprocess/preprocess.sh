#!/usr/bin/env bash

for file in /pfs/inbox/*; do
  echo -n "Preprocessing $file..."
  grep '[^[:blank:]]' < $file > /pfs/out/$(basename "$file")
  echo Done
done

SENDGRID_API_KEY=$(cat /tmp/sendgrid/api_key)

http --ignore-stdin POST https://api.sendgrid.com/v3/mail/send \
  Authorization:"Bearer $SENDGRID_API_KEY" \
  personalizations[0][to][][email]="$NOTIFICATION_EMAIL" \
  from[email]='no-reply@neu.ro' \
  subject='New raw data' \
  template_id='d-7c2124297cee4693afeef49546b178bb'


echo "All done"