
# aws ec2 describe-instances --filters 'Name=tag:Name,Values=Joel*'   --output text --query 'Reservations[*].Instances[*].InstanceId' | xargs aws ec2 stop-instances --instance-ids

 function ec2-by-tag() {
   tag_name="$1"
   tag_value="$2"
   if [[ -z $tag_name ]] || [[ -z $tag_value ]];then
     echo "Usage: ec2-by-tag <tag-name> <tag-value>"
     return 1;
   fi

   aws ec2 describe-instances --filters "Name=tag:$1,Values=$2" --output text --query 'Reservations[*].Instances[*].InstanceId'

 }

function _ec2-do() {
  local fn="$1"
  local tag_name="$2"
  local tag_value="$3"
  local ec2_instance_id=$(ec2-by-tag $tag_name $tag_value)

  if [[ -z $ec2_instance_id ]]; then
    echo "No instance found for $tag_name=$tag_value"
    return 1
  fi

  aws ec2 $fn --instance-ids $ec2_instance_id
}

function ec2-start() {
  _ec2-do start-instances $1 $2
}

function ec2-stop() {
  _ec2-do stop-instances $1 $2
}

function devbox() {
  cmd="ec2-$1 DevOwner joel"
  $cmd
}

