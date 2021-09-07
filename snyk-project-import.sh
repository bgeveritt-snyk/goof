#!/bin/bash
# Snyk Project Import

echo $OWNER
echo $REPOSITORY

wget --no-check-certificate --debug \
  --method POST \
  --timeout=0 \
  --header 'Authorization: token $SNYK_TOKEN' \
  --header 'Content-Type: application/json; charset=utf-8' \
  --body-data '{
  "target": {
    "owner": "'$OWNER'",
    "name": "'$REPOSITORY'",
    "branch": "main"
  }
}' \
   'https://snyk.io/api/v1/org/$SNYK_ORG/integrations/$SNYK_INTEGRATION_ID/import'
