# stafi-docker
Tools to build and run the stafi node as a docker image  - https://docs.stafi.io/

## Prerequisites



## Installation Step 

1. Install docker on your host machine from: https://docs.docker.com/get-docker/
2. Clone this repository
    ```
    git clone https://github.com/hyperbot16/stafi-docker.git && cd stafi-docker
    ```
3. Build the image using (You might need to watch The Irishman while you wait for this)
    ```
    ./build_image.sh --branch sitara
    ```
4. Start your stafi node container (as a validator). This command takes the same arguments as the stafi binary
    ```
    ./stafi.sh --chain=sitara --validator --name 'CustomName|FIRST_TEN_10_STASH_CHARS' --pruning=archive
    ```


## Tip and Tricks

* To see the list of option available to the stafi.sh command run 

  ```
  docker run --rm local/stafi:latest /opt/stafi-node/target/release/stafi --help
  ```

* You can follow the logs of your docker container by running:
  
  ```
    docker logs -f stafi_node --tail 100
  ```

* You can get your validator session keys by running
  ```
    docker exec stafi_node  \
    curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}' http://localhost:9933
  ```

* Please do refer to the validator guide at https://docs.stafi.io/staking/validator-guide to learn more.

* If you find any bug or have issues please do not hesitate to contact hyperbot


## Notes

> I didn't make an image available on dockerhub for obvious reasons. You should not trust
third party images as they may contain goodies that you might not like. However the team
can build an image using this repository and make it available. This will save you 2 hours
of your life. That Rust for you. 

---

> If this repository has helped you and you would like to show your appreciation, 
> please do not hesitate to nominate **STAKEFISio** as one of your validators

