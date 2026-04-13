#!/bin/sh

echo "Start tunnel"
echo "Using AWS profile: $AWS_PROFILE"
echo "Target instance: $INSTANCE_ID"
echo "RDS host: $RDS_HOST"

# Check profile availability
aws sts get-caller-identity --profile $AWS_PROFILE

# Launch the RDS tunnel
aws ssm start-session \
    --target $INSTANCE_ID \
    --document-name AWS-StartPortForwardingSessionToRemoteHost \
    --parameters "{\"host\":[\"$RDS_HOST\"],\"portNumber\":[\"3306\"],\"localPortNumber\":[\"13306\"]}" \
    --profile $AWS_PROFILE \
    --region $AWS_REGION &


# delay for the RDS tunnel to start
sleep 10

echo "Forwarding 127.0.0.1:13306 → 0.0.0.0:13306 for Docker network"

# Forwarding 127.0.0.1:3306 → 0.0.0.0:3306
socat TCP-LISTEN:3306,fork,bind=0.0.0.0 TCP:127.0.0.1:13306