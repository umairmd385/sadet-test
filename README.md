# System Admin / DevOps Engineer Test

## IMPORTANT:
- Deadline is usually +3 days (before 12MN +4GMT) from the moment the test was sent to you (Example: If sent on Monday, deadline is Thursday at 12MN +4GMT or Friday 12AM).
- Ouput that needs to be sent to us:
    - Working URL of the app that can be accessible online.
    - Upload the project to your own repo and send us the link (optional but highly recommended as this will be reviewed before calling you for the interview and also it will be one of topic of discussion during the next phase of the interview).
- Describe extra step that you took to make your output outstanding compare to other candidates (Example: setting up SSL, LB, etc...)

### Test assignment A: Docker and Microservices
**Objective:** To assess the candidate’s ability to work with Docker and microservices architecture.

**Task Description:**
- This app includes App (PHP), MySQL and Redis services.
- Containerize these services using Docker. Each service should have its own Dockerfile.
- Write a docker-compose.yml file to orchestrate the services.
- Ensure that the services can communicate with each other and are scalable.
- Document the steps to build and run the containers, and any assumptions made in the process.
- Send us the repo link (optional but highly recommended).

**Evaluation Criteria:**
- Understanding of Docker concepts and containerization.
- Ability to set up a microservices architecture.
- Quality of the Dockerfiles and docker-compose configurations.
- Documentation and clarity of instructions.

### Test assignment B: Continuous Integration/Continuous Deployment (CI/CD)
**Objective:** To evaluate the candidate's experience with CI/CD pipelines and version control systems.

**Task Description:**
- Using the output from Test A. 
- Create a CI/CD pipeline using a tool like Jenkins, GitLab CI, or GitHub Actions (The pipeline should include stages for building, testing, and deploying the application).
- Document the CI/CD setup and provide instructions on how the pipeline works, including how to trigger builds and deployments.

**Evaluation Criteria:**
- Proficiency in using version control (Git).
- Ability to set up and configure CI/CD pipelines.
- Understanding of automated testing and its integration into CI/CD.
- Documentation quality and the ability to explain the CI/CD process.

### Test assignment C: Deployment to a Cloud or Server Environment
**Objective:**  To assess the candidate’s ability to deploy applications to a cloud or server environment, integrating the work done in Test B.

**Task Description:**
- Take the CI/CD pipeline and the web application developed in Test B (If you are not familiar with CI/CD, you may use output from Test A instead).
- Extend the CI/CD pipeline to include a deployment stage that automatically deploys the application to a cloud provider (AWS, Azure, GCP) or a server environment of your choice.
- Ensure the deployment includes necessary environment configurations (like virtual networks, security groups, etc.) and is scalable.
- Implement basic monitoring and logging for the application in the cloud/server environment.
- Document the deployment process, including any scripts or configuration files used, and instructions on how to access the deployed application.

**Evaluation Criteria:**
- Ability to integrate deployment into an existing CI/CD pipeline.
- Understanding of cloud services and server management (depending on the deployment target).
- Implementation of security best practices in the deployment.
- Setup of basic monitoring and logging for the application.
- Quality of documentation and ease of accessing the deployed application.