function acl-env {
  # unset DOCKER_TLS_VERIFY
  # unset DOCKER_CERT_PATH
  # export DOCKER_HOST=tcp://192.168.33.42:2375
  export AWS_PROFILE=acl
  alias ssh="/usr/local/bin/sdm ssh wrapped-run"
  alias scp="scp -S'/usr/local/bin/sdm' -osdmSCP"
  . ~/src/aclaimant/Envfile
}

alias acl='acl-env'
