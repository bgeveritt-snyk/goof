#!/bin/bash
# Snyk Project Delete

BRANCH_NAME=${GITHUB_REF##*/}
OWNER_REPO_BRANCH=$OWNER$'/'$REPO'('$BRANCH')'

snykResponse=$(curl -s POST 'https://snyk.io/api/v1/org/'$SNYK_ORG'/projects' \
--header 'Authorization: token '$SNYK_TOKEN'' \
--header 'Content-Type: application/json' \
--data-raw '{ 
    "filters": { 
        "name": "'$OWNER_REPO_BRANCH'" 
    } 
}' | jq -r '.projects[].id')

for project in $snykResponse; do
  curl -s -X DELETE 'https://snyk.io/api/v1/org/'$SNYK_ORG'/'$project'' \
  --header 'Authorization: token '$SNYK_TOKEN'' \
  --header 'Content-Type: application/json'
done
