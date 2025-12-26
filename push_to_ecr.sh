#!/bin/bash

# Variables
AWS_ACCOUNT_ID="123456789012"
AWS_REGION="eu-north-1"
LOCAL_IMAGE="aws-cicd-app:latest"
ECR_REPO="docker-python-app"
ECR_IMAGE="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:latest"

echo "Logging out from ECR..."
docker logout ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "Logging in to ECR..."
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com || exit 1

echo "Tagging local image..."
docker tag ${LOCAL_IMAGE} ${ECR_IMAGE} || exit 1

echo "Pushing image to ECR..."
docker push ${ECR_IMAGE} || exit 1

echo "Verifying pushed image in ECR..."
aws ecr describe-images --repository-name ${ECR_REPO} --region ${AWS_REGION}
