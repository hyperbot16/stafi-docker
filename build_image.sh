#!/usr/bin/env bash
set -euo pipefail


NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'


usage() {
    echo "Usage: $0 [option...]" >&2
    echo
    echo "   -b, --branch BRANCH        Switch to BRANCH"
    echo "   -np, --nopull              Do not pull stafi repository"
    echo "   -h, --help                 Show this help "
    echo
    exit 1
}

nopull=''
branch=''


while [[ "$#" -gt 0 ]]; do
    case $1 in
        -b|--branch) 
            branch="$2"; 
          shift
          ;;
        -np|--nopull)
          nopull=1 
          ;;
        -h | --help)
          usage
          exit 0
          ;;
        *) 
          echo "Unknown parameter passed: $1"; 
          usage
          exit 1 
          ;;
    esac
    shift
done

echo $branch


if [ -z $branch ]; then
REPLY=''
echo -e "${YELLOW}You have not specified a branch to build. This will build the master branch${NC}"
read -p "Are you sure you want to continue (y|n): " $REPLY

  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
      echo -e "${GREEN}OK! make sure you select the correct branch next time... ${NC}"
      exit 1
  fi
fi

if [ -z $nopull ]
then
  echo -e "${GREEN}Clonning the stafi repository...${NC}"
  rm -rf ./stafi-node
  git clone https://github.com/stafiprotocol/stafi-node.git
elif [ ! -d './stafi-node' ]
then
  echo -e "${RED}I cannot find the 'stafi-node' folder in the current directory ${NC}"
  echo -e "${RED}Please make sure you pull the repository if you dont want me to do it for you.${NC}"
  exit 1
fi 

# checkout branch
if [ ! -z $branch ]; then
    pushd stafi-node
    git checkout $branch
    popd
fi


echo -e "${GREEN}Building new image...${NC}"
docker build -t local/stafi -f Dockerfile .
echo


echo -e "${GREEN}Image build completed.${NC}"