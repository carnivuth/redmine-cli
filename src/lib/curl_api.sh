## Add any function here that is needed in more than one parts of your
## application, or that you otherwise wish to extract from the main function
## scripts.
##
## Note that code here should be wrapped inside bash functions, and it is
## recommended to have a separate file for each function.
##
## Subdirectories will also be scanned for *.sh, so you have no reason not
## to organize your code neatly.
##
curl_api() {
  path="$1"
  method="$2"
  params="-s $REDMINE_ADDRESS/$path -X $method"
  # check for data
  if [[ "$3" != '' ]];then
    params="$params -d $3"
  fi
  if [[ "$4" != '' ]];then
    params="$params -H $4"
  fi
  curl $params
}
