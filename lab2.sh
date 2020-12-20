#! /bin/bash
# Cloud Functions
# Initializing Configuration
#gcloud init < a

ID=$(gcloud info --format='value(config.project)')
gcloud config set project $ID

export IMAGE_FAMILY="windows-2012-r2-core"
export ZONE="us-central1-a"
export INSTANCE_NAME="my-new-instance"
export INSTANCE_TYPE="n1-standard-8"
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-project="windows-cloud" \
        --image-family=$IMAGE_FAMILY \
