aws cloudformation create-stack  --region ap-southeast-1 --stack-name main-stack --template-body file://main.yaml

aws cloudformation deploy --template-file vpc-stack.yaml --stack-name my-vpc --region ap-southeast-1 --capabilities CAPABILITY_NAMED_IAM

aws s3 cp vpc-stack.yaml s3://cloudformation-template-sourcecode/

aws cloudformation create-stack --stack-name main-stack  --region ap-southeast-1  --template-body file://main.yaml --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND