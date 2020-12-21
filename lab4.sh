#! /bin/bash
# Cloud Functions
# Initializing Configuration
#gcloud init < a

ID=$(gcloud info --format='value(config.project)')
gcloud config set project $ID
export INSTANCE_NAME="dev-instance"
export ZONE="us-central1-a"
gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
gcloud beta compute instances create dev-instance --zone=us-central1-a --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server --image=debian-10-buster-v20201216 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=dev-instance-2 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
sudo gcloud compute config-ssh
gcloud compute ssh --project=$ID --zone=$ZONE $INSTANCE_NAME -- 'sudo apt-get update && sudo apt-get install git && sudo apt-get install python3-setuptools python3-dev build-essential && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python3 get-pip.py && git clone https://github.com/GoogleCloudPlatform/training-data-analyst && cd ~/training-data-analyst/courses/developingapps/python/devenv/ && sudo python3 server.py'
