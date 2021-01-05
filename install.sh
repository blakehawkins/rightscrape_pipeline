#!/usr/bin/env bash

set -euxo pipefail

sudo mkdir -p /opt/rightscrape_pipeline/
sudo cp input.tsv /opt/rightscrape_pipeline/
sudo cp run.sh /opt/rightscrape_pipeline/

echo '
---
token: ""
password: "<password>"
room: "#roomname:matrix.org"
account: "cooluser"
html_json_key: "html"
' > /tmp/config.yaml

sudo cp /tmp/config.yaml /opt/rightscrape_pipeline/

sudo apt-get install jq
which xsv          || cargo install xsv
which rightscrape  || cargo install rightscrape
which filterfrom   || cargo install filterfrom
which rightscrapex || cargo install rightscrapex
which send_glitch  || cargo install send_glitch
