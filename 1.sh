ID=$(gcloud info --format='value(config.project)')
docker pull alpine
docker tag alpine gcr.io/$ID/node-app:0.2
docker push gcr.io/$ID/node-app:0.2

echo "Lab Completed"
