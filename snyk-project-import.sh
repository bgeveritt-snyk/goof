#!/bin/bash
# Snyk Project Import

wget --no-check-certificate --quiet \
  --method POST \
  --timeout=0 \
  --header 'Authorization: token $SNYK_TOKEN' \
  --header 'Content-Type: application/json; charset=utf-8' \
  --body-data '{
  "target": {
    "owner": "$OWNER",
    "name": "$REPOSITORY",
    "branch": "$BRANCH_NAME"
  }
}' \
   'https://snyk.io/api/v1/org/$SNYK_ORG/integrations/$SNYK_INTEGRATION_ID/import'
