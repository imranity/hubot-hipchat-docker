# Hubot-hipchat-docker image 

Hubot-hipchat-docker is a docker image to start hubot hipchat with redis as backend.  

Only requirement is to pass the hipchat credentials as environment variables during runtime.  

The container starts with two services when run:
	
	redis-server
	hubot (with hipchat as adapter)

## Building the image

The image is built with following command:

	docker build -t hubot-hipchat .

## Running the container

An easy way to run the container is to first create a file that credentials for your hipchat bot account and later pass it as env during container 
run.  

1. First create a file lets say `creds.list` that looks like following:  
cat <<EOF > creds.list  
HUBOT_HIPCHAT_TOKEN="AUTH TOKEN OF BOT USERS HIPCHAT ACCOUNT"  
HUBOT_HIPCHAT_JID="JABBER ID OF BOT USER"  
HUBOT_HIPCHAT_PASSWORD="ACTUAL PASSWORD"  
HUBOT_HIPCHAT_ROOMS="ROOM URL TO CONNECT WHEN HUBOT STARTS"   
EOF  
The details of these credentials can be found here [official-hubot-hipchat-plugin](https://github.com/hipchat/hubot-hipchat). 

2. After setting the credentials in creds.list, start the container:  
`docker run -d --env-file creds.list --name hubot-hipchat hubot-hipchat`

3. Confirm services are running:   
`docker logs hubot-hipchat`  
`2017-02-04 05:28:51,010 INFO success: hubot entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)`  
`2017-02-04 05:28:51,010 INFO success: redis entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)`  


