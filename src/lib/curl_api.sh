curl_api() {
  path="$1"
  method="$2"
  params="-s $REDMINE_ADDRESS/$path -X $method -u "$REDMINE_USERNAME:$REDMINE_PASSWORD""
  # check for data
  if [[ "$3" != '' ]];then
    params="$params -d $3"
  fi
  if [[ "$4" != '' ]];then
    params="$params -H $4"
  fi
  curl $params
}
