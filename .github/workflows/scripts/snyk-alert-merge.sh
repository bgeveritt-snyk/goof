#!/bin/bash
# Snyk Alert Merge

projectId=$(curl -s POST 'https://snyk.io/api/v1/org/'$SNYK_ORG'/projects' \
--header 'Authorization: token '$SNYK_TOKEN'' \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw '{ "filters": { "name": "'$REPOSITORY'(main)", "type": "sast" } }' | jq -r '.projects[].id')

curl -s $SLACK_WEBHOOK_URL \
--header 'Content-type: application/json' \
--data-raw '{ "blocks": [ { "type": "section", "text": { "type": "mrkdwn", "text": "Branch `'$HEAD_REF'` merged in to `'$BASE_REF'`" } }, { "type": "section", "text": { "type": "mrkdwn", "text": "<https://app.snyk.io/project/'$projectId'|View Snyk Results>" } } ] }'
