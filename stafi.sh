#!/usr/bin/env bash
set -euo pipefail

staffi_image="local/stafi:latest"

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

echo
echo -e "${RED}Ensure you run the cleanup.sh script before running this script${NC}"
echo

echo -e  "${GREEN}Starting stafi container...${NC}"
docker run -d --restart=unless-stopped --name stafi_node \
--memory-reservation="5000m" \
--mount source=chain_data,target=/root/.local/ \
--entrypoint /opt/stafi-node/target/release/stafi \
${staffi_image}  $@

echo -e  "${GREEN}Container Started.${NC}"
echo
echo -e  "${YELLOW}You can check the log of your stafi container using `docker logs -f stafi_node --tail 100`"
echo -e  "Hit CTRL-C to abort the output."
echo -e  "${NC}"

