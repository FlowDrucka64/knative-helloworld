# Hello world tutorial using minikube and knative
(This is tested for WSL for Windows)
## Requirements
- docker
- minikube (https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
- (optionally) make

# Steps
With make:
- ``make minikube`` : creates a minikube
- ``make knative`` : installs knative on the minikube and sets up magicdns
- ``make deploy``: deploys the hello wolrd funciton onot knative
- ``make tunnel``: opens a tunnel to the kube so its exposed to the local network
- visit ``http://hello.default.127.0.0.1.sslip.io/``
- ``make clean``: shuts down and deletes the minikube

Without make:
- copy & execute the commands from  Makefile in the order given above