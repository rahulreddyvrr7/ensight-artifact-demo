#!/bin/bash
set -e
echo "📦 Downloading from release: $RELEASE_TAG"
mkdir -p dependencies

release_id=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/tags/${RELEASE_TAG}" | jq -r '.id')

assets=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/${release_id}/assets" | jq -r '.[] | .name')

for asset in $assets; do
  echo "⬇️ Downloading $asset"
  asset_id=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/${release_id}/assets" | jq -r ".[] | select(.name==\"$asset\") | .id")

  curl -L -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/octet-stream" \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/assets/${asset_id}" \
    -o "dependencies/$asset"
done

ls -lh dependencies/
