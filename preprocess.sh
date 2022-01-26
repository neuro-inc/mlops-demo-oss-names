http --ignore-stdin POST https://api.sendgrid.com/v3/mail/send Authorization:"Bearer $SENDGRID_API_KEY" \
  personalizations[0][to][][email]='alexey.naiden@neu.ro' \
  from[email]='no-reply@neu.ro' \
  subject='New raw data' \
  template_id='d-7c2124297cee4693afeef49546b178bb'

for file in /pfs/inbox/*; do
  echo Preprocessing $file...
  grep '[^[:blank:]]' < $file > /pfs/out/$(basename "$file")
  echo Completed
done

echo All done