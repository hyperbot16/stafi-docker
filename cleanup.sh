#!/usr/bin/env bash
set -euo pipefail

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

echo -e "${GREEN}Removing old stafi_node container... ${NC}"
docker rm -f stafi_node