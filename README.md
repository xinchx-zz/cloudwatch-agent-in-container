# Build docker image

  docker build -t starchx/centos-httpd-cloudwatch .

# Push docker image

  docker push starchx/centos-httpd-cloudwatch

# Remove previous pods in EKS

  kubectl delete -f pod.yaml

# Launch a new pod in EKS

  kubectl apply -f pod.yaml

# CloudWatch can be configured in amazon-cloudwatch-agent.json

# Requirements
  - CloudWatch installer requires system init, so I use this one as base image from Centos https://hub.docker.com/r/centos/systemd/
  - Container needs to be launched with privileges and access to sys-fs-cgroup (refer to pod.yaml)
  - EKS worker node instance role needs to have "CloudWatchAgentServerPolicy" policy attached

# Tested and confirmed logs are showing up in CloudWatch Console.
