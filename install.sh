#!/usr/bin/env bash

set -euxo pipefail

sudo mkdir -p /opt/rightscrape_pipeline/
cp input.tsv /opt/rightscrape_pipeline/
cp run.sh /opt/rightscrape_pipeline/

echo '
---
token: ""
password: "<password>"
room: "#roomname:matrix.org"
account: "cooluser"
html_json_key: "html"
' > /opt/rightscrape_pipeline/config.yaml

sudo apt-get install jq
cargo install xsv
cargo install rightscrape
cargo install filterfrom
cargo install rightscrapex
pushd ~/ && git clone git@github.com:blakehawkins/send_glitch.git && pushd send_glitch && cargo install && popd && popd
