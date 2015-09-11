function alert {
  $@
  if [[ "$?" -gt 0 ]]; then
    sound=Basso.aiff
  else
    sound=Tink.aiff
  fi
  (nohup afplay /System/Library/Sounds/$sound >/dev/null 2>&1 &) > /dev/null 2>&1
}
