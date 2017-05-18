#!/usr/bin/env bash

SFR_ID="$1"
REGION="$2"

spot_fleet_instance_ids=$(aws ec2 describe-spot-fleet-instances \
    --region ${REGION} \
    --spot-fleet-request-id ${SFR_ID} \
    --query "ActiveInstances[*].InstanceId" \
    --output text)

spot_fleet_instance_ip_addresses=$(aws ec2 describe-instances \
    --region ${REGION} \
    --instance-ids ${spot_fleet_instance_ids} \
    --query "Reservations[*].Instances[*].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress" \
    --output text)

echo ${spot_fleet_instance_ip_addresses}