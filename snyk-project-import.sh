#!/bin/bash
# Snyk Project Import

echo $OWNER
echo $REPOSITORY
echo $BRANCH_NAME
echo Reserved for REPO_NAME=${GITHUB_REPOSITORY##*/}
echo GITHUB_REF=${GITHUB_REF}
echo EXTRACT_GITHUB_REF=${GITHUB_REF##*/}
echo EXTRACT_GITHUB_REF_HEADS=$(echo ${GITHUB_REF#refs/heads/})

wget --no-check-certificate --quiet \
  --method POST \
  --timeout=0 \
  --header 'Authorization: token '$SNYK_TOKEN'' \
  --header 'Content-Type: application/json; charset=utf-8' \
  --body-data '{
  "target": {
    "owner": "'$OWNER'",
    "name": "'$REPOSITORY'",
    "branch": "main"
  }
}' \
   'https://snyk.io/api/v1/org/'$SNYK_ORG'/integrations/'$SNYK_INTEGRATION_ID'/import'
