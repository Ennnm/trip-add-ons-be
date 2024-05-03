# from the dropdown at the top of Cloud Console:
export GCLOUD_PROJECT="trip-addons" 
# from Step 2.2 above:
export REPO="trip-add-on-repo"
# the region you chose in Step 2.4:
export REGION="us-central1"
# whatever you want to call this image:
export IMAGE="tripaddons"

# use the region you chose above here in the URL:
export IMAGE_TAG=${REGION}-docker.pkg.dev/$GCLOUD_PROJECT/$REPO/$IMAGE

# Build the image:
# docker build -t $IMAGE_TAG -f Dockerfile --platform linux/x86_64 .
# Push it to Artifact Registry:
docker push $IMAGE_TAG