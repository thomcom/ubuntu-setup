#!/usr/bin/env bash

set -e
set -o errexit

cd $(dirname "$(realpath "$0")")/../

SLACK_VERSION="4.0.2"

trap 'ERRCODE=$? \
  && cd - \
  && rm -rf ~/.npm ./slack-desktop-*.deb \
  && exit $ERRCODE' \
  ERR EXIT

# Slack desktop
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb
sudo apt install -y ./slack-desktop-*.deb

# Slack black theme
cd slack-black-theme
bash -i ./darkSlack.sh
