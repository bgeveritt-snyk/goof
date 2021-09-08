#!/bin/bash
# Snyk Project Import

BRANCH_NAME=${GITHUB_REF##*/}

curl -s POST 'https://snyk.io/api/v1/org/'$SNYK_ORG'/integrations/'$SNYK_INTEGRATION_ID'/import' \
--header 'Authorization: token '$SNYK_TOKEN'' \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw '{
  "target": {
    "owner": "'$OWNER'",
    "name": "'$REPOSITORY'",
    "branch": "'$BRANCH_NAME'"
  }
}'
