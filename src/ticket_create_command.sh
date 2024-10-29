#{
#  "issue": {
#    "project_id": 1,
#    "subject": "Example",
#    "priority_id": 4
#  }
#}


path="issues.json"
subject="${args[subject]}"
description="${args[description]}"
if [[ -z ${args[subject]} ]] || [[ -z ${args[description]} ]]; then
  tmpfile="$(mktemp)"
  if [[ ! -z ${args[subject]} ]];then echo ${args[subject]} > "$tmpfile"; fi
  vim "$tmpfile"
  subject="$(head "$tmpfile" -n1)"; if [[ -z "$subject" ]];then echo "insert subject"; exit 1; fi
  description="$(tail "$tmpfile" -n+1)"
fi
rm "$tmpfile"

tmpfile="$(mktemp)"
# create data payload
jq -n --argjson issue \
  "$(jq -n \
  --arg subject "$subject" \
  --arg description "$description" '$ARGS.named')" '$ARGS.named' > "$tmpfile"

curl_api $path POST "$(cat "$tmpfile")" "Content-Type: application/json"
rm "$tmpfile"
