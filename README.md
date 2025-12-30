# Cloud-Native CI/CD Project (Local Simulation)
-This project demonstrates an **end-to-end cloud-native CI/CD workflow** using Docker and AWS ECR.  
-Due to AWS Free Tier restrictions, this project **simulates CI/CD locally** instead of using AWS CodeBuild.

## Project Overview
-Local development using Python Flask
- Dockerized application
- Push Docker image to AWS ECR
- Pull and run from ECR (deployment simulation)
- Fully documented CI/CD workflow


## Architecture / CI/CD Flow
A[Local Code] --> B[Docker Build]
B --> C[Test Locally]
C --> D[Tag Docker Image for ECR]
D --> E[Push to AWS ECR]
E --> F[Pull & Run Locally or ECS Deployment]

- Local Code → changes in app/app.py
- Docker Build → builds local Docker image
- Test Locally → run container to verify changes
- Tag Docker Image → prepare artifact for ECR
- Push to AWS ECR → stores Docker image in cloud
- Pull & Run → deploy locally or future ECS deployment

# Project Files
aws-cloud-native-cicd/
├── app/
│   └── app.py
├── Dockerfile
├── requirements.txt
├── README.md
└── buildspec.yml  (optional for future AWS CodeBuild)




