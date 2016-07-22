function acl-env {
  unset DOCKER_TLS_VERIFY
  unset DOCKER_CERT_PATH
  export DOCKER_HOST=tcp://192.168.33.42:2375
  #. ~/src/aclaimant/dashboard/.env
}
