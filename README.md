## run the following command to create stack
# the vpc-eks-stack.yaml file creates custom VPC, EKS control plain, NodeGroup using Launch template basic configuration.

aws cloudformation create-stack --stack-name vpc-eks-stack --template-body file://vpc-eks-stack.yaml --capabilities CAPABILITY_NAMED_IAM --region ap-southeast-1

## Update Kubeconfig
aws eks update-kubeconfig --region ap-southeast-1 --name vpc-eks-stack-cluster

## Run the following command to apply Manifest file.
# The Manifest.yaml file contains nginx and service and type is loadbalancer.

kubectl get nodes
kubectl get pods
kubectl apply -f manifest.yaml
# nginx is deployed on private subnet.

kubectl get deployments
kubectl get pods

# get url to connect to the application.
kubectl get svc
# copy the url below EXTERNAL-IP.

## Baston Host config
- Launch a Baston-Host with custom Vpc used to create Eks.
- The VM should be launched on public subnet.
- Make sure the public subnet facing to internet-gateway.

# Check the url
Example: curl internal-aff4380171621426db0dbdff74d7cb85-337029415.ap-southeast-1.elb.amazonaws.com

## Delete the Deployment
kubectl delete deployment nginx

## Delete the service
kubectl delete svc nginx --grace-period=0 --force
(or)
kubectl delete svc --all -n your-namespace

