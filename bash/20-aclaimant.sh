function acl-env {
  # unset DOCKER_TLS_VERIFY
  # unset DOCKER_CERT_PATH
  # export DOCKER_HOST=tcp://192.168.33.42:2375
  export AWS_PROFILE=acl
  . ~/src/aclaimant/Envfile
  unset DOCKER_HOST
}

alias acl='acl-env'
