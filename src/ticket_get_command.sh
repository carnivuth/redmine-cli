#echo "# this file is located in 'src/ticket_get_command.sh'"
#echo "# code for 'redmine-cli ticket get' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args
path="/issues.json"
if [[ ! -z ${args[id]} ]]; then
  path="$path?issue_id=${args[id]}"
fi

curl_api $path GET | jq
