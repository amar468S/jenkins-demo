filter="TBD-Slave"
	AWS_INSTANCE_WITH_ID=$(aws ec2 describe-instances --filter Name=tag:Name,Values="${filter}"  --query "Reservations[*].Instances[*].[InstanceId]" --output text)
	if [ "$State" = "Start" ] then
  		aws ec2 start-instances --instance-ids $AWS_INSTANCE_WITH_ID
  		echo Instance $InstanceID Started
	elif [ "$State" = "Stop" ] then
  		aws ec2 stop-instances --instance-ids $AWS_INSTANCE_WITH_ID
 	 	echo Instance $InstanceID Stopped
	fi
