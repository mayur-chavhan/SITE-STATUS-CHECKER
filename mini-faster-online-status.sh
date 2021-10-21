#!/bin/bash
#
# Author: Mayur G. Chavhan
# Github: https://github.com/mayur-chavhan/
#

#=================================================================
set -o errtrace
set -o nounset
set -o pipefail

# Add your domains which needs monitoring.
DOMAIN_LIST=./domain-list.txt
NOTIFY_TO=./email-list.txt

function ONLINE_CHECK {

  HTTP_RESPONSE=$(curl -L --write-out %{http_code} --silent --output /dev/null "${1}")

    [[ "${HTTP_RESPONSE}" == "200" ]] &&  echo -e " [ Success ] ${1} ${HTTP_RESPONSE}" || echo -e "Hey There, \n Please check site has some issue, \n\n [  Error   ] DOMAIN : ${1} \n RESPONSE CODE = [ ${HTTP_RESPONSE} ]" | mail -s "[WARNING] $1 [ HTTP Status Code = ${HTTP_RESPONSE} ]" $NOTIFY_TO

}

# checking url loop
while read WEB_URL; do
  ONLINE_CHECK $WEB_URL 
done < $DOMAIN_LIST | column -t


