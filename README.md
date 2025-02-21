# Docker Hello World

This repository contains a simple Flask application that can be containerized using Docker, pushed to Docker Hub, and deployed on Kubernetes using Docker Desktop.

## Prerequisites

Ensure you have the following installed on your system:
- Docker Desktop
- Git
- A Docker Hub account
- Kubectl (included with Docker Desktop)
- AWS CLI (if deploying on AWS)

---

## 1. Clone the Repository

```sh
 git clone https://github.com/Chukwuemeka-James/Docker-Hello-World.git
 cd Docker-Hello-World
```

---

## 2. Build the Docker Image

```sh
 docker build -t your-dockerhub-username/hello-world:v1 .
```

Replace `your-dockerhub-username` with your actual Docker Hub username.

---

## 3. Run the Docker Container

```sh
 docker run -it -p 5001:5000 your-dockerhub-username/hello-world:v1
```

Access the application in your browser at:
- **http://localhost:5001/** 
- **http://localhost:5001/test** 

---

## 4. Push the Image to Docker Hub

1. Log in to Docker Hub:
    ```sh
    docker login
    ```
2. Push the image:
    ```sh
    docker push your-dockerhub-username/hello-world:v1
    ```

---

## 5. Deploy on Kubernetes (Using Docker Desktop)

### a) Enable Kubernetes in Docker Desktop
Go to **Docker Desktop > Settings > Kubernetes** and enable it. Apply and restart if needed.

### b) Deploy the Application

```sh
kubectl create deployment hello-world-deployment --image=your-dockerhub-username/hello-world:v1
```

### c) Expose the Application

```sh
kubectl expose deployment hello-world-deployment --type=LoadBalancer --port=5000
```

### d) Get Service URL

```sh
kubectl get services
```
Check the `EXTERNAL-IP` column. If it shows `localhost`, open:
- **http://localhost:5001/**

To delete the deployment and service:
```sh
kubectl delete deployment hello-world-deployment
kubectl delete service hello-world-deployment
```

---

## 6. Deploy on AWS (ECS using Fargate)

### a) Authenticate Docker with AWS ECR

```sh
aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-aws-account-id.dkr.ecr.your-region.amazonaws.com
```

### b) Create an AWS ECR Repository

```sh
aws ecr create-repository --repository-name hello-world
```

### c) Tag and Push the Image to AWS ECR

```sh
docker tag your-dockerhub-username/hello-world:v1 your-aws-account-id.dkr.ecr.your-region.amazonaws.com/hello-world:v1
docker push your-aws-account-id.dkr.ecr.your-region.amazonaws.com/hello-world:v1
```

### d) Deploy the Image using AWS ECS (Fargate)
- Go to **AWS Console** → **ECS** → **Create Cluster** (Choose Fargate)
- Create a **Task Definition** using the pushed image
- Create a **Service** and deploy the task
- Once deployed, get the **Public IP** and open it in your browser

---

## Conclusion

This guide walks you through containerizing a simple Flask app, deploying it locally with Docker, pushing to Docker Hub, running on Kubernetes with Docker Desktop, and deploying to AWS ECS.

Happy Coding!

