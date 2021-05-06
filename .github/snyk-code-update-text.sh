#!/bin/sh
jq '.["runs"][0]["results"][]["locations"][].physicalLocation.artifactLocation.uri |= walk(if type == "string" then gsub($WORKSPACE; "") else . end)' snyk-code.sarif > snyk-code.sarif.tmp && cp snyk-code.sarif.tmp snyk-code.sarif && rm snyk-code.sarif.tmp
jq 'del(.["runs"][0]["results"][].message.text) | .["runs"][0]["results"][].message |= with_entries(if .key == "markdown" then .key = "text" else . end)' snyk-code.sarif > snyk-code.sarif.tmp && cp snyk-code.sarif.tmp snyk-code.sarif && rm snyk-code.sarif.tmp
