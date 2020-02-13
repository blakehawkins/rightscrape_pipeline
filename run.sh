#!/usr/bin/env bash

set -euxo pipefail

rightscrape < <(xsv select 2 /opt/rightscrape_pipeline/input.tsv) | \
  filterfrom /opt/rightscrape_pipeline/banlist | \
  tee /tmp/proplist.tmp | \
  rightscrapex --floorplan --json | \
  jq '{html: (.summary + "; " + .human_identifier + "; " + .price + " | <a href=\"https:" + .location_image_url + "\">Location</a> | <a href=\"" + .url + "\">Listing</a>")}' | \
  xargs send_glitch /opt/rightscrape_pipeline/config.yaml

cat /tmp/proplist.tmp >> /opt/rightscrape_pipeline/banlist
