#!/usr/bin/env bash
set -e

STAGING_API="https://vesca-backend-staging.up.railway.app"
PROD_API="https://vesca-backend-production.up.railway.app"

# Swap API URL, deploy, restore
sed "s|${PROD_API}|${STAGING_API}|g" app.html > app.html.staging
mv app.html.staging app.html
npx wrangler deploy --config wrangler.staging.jsonc
git checkout app.html
