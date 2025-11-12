#!/bin/bash
set -e
echo "🚀 Uploading to release: $RELEASE_TAG"

if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ Missing GITHUB_TOKEN"
  exit 1
fi

release_id=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/tags/${RELEASE_TAG}" | jq -r '.id')

if [ "$release_id" == "null" ]; then
  echo "❌ Release not found: $RELEASE_TAG"
  exit 1
fi

for file in output/*; do
  filename=$(basename "$file")
  echo "⬆️ Uploading $filename"
  curl -s --data-binary @"$file" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: application/octet-stream" \
    "https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${release_id}/assets?name=${filename}"
done
