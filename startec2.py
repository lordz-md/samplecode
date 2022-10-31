import boto3
import os

def lambda_handler(event, context):
    region = os.environ.get("REGION").strip()
    ec2 = boto3.client('ec2', region_name=region)
    ec2_instances = []
    for reservation in ec2.describe_instances(Filters=[{'Name':'tag:Schedule','Values':['workinghours']}])['Reservations']:
        for instance in reservation['Instances']:
            ec2_instances.append(instance['InstanceId'])
            ec2.start_instances(InstanceIds=ec2_instances)
            print('Started your instances: ' + str(ec2_instances))
