#!/bin/bash
# Author: Mayur Chavhan
# github: https://github.com/mayur-Chavhan
#
set -u

# Update inside email-list.txt file to your email address

NOTIFY_TO=./email-list.txt

		printStyle="%-25s %-40s %-30s %-20s\n"
		printTitle=$(printf "${printStyle}" "   HTTP Status" "URL" "Status Message")
		printLine=$(printf "${printStyle}" "  ==================" "===========================" "===========================")

		echo "${printLine}"
		echo "${printTitle}"
		echo "${printLine}"


while read URL; do


		function unknown_status() {
		    if [ "${status_code::1}" == "4" ]; then
		        echo "Unknown Client Error"
		    fi

		    if [ "${status_code::1}" == "5" ]; then
		        echo "Unknown Server Error"
		    fi

		}

		function AlertMail() {

			if [[ command -v mail ]]; then

				mail -s "ALERT !! Site ==> ${URL} has ERROR CODE ${status_code}" ${NOTIFY_TO} < log.txt
			else
				echo -e "\n\tMail can't be send \n[X] Mail is not installed !! \n"
			fi
		}

		printStyle="%-25s %-40s %-30s %-20s\n"

		status_code=$(curl --head --location --connect-timeout 5 --write-out %{http_code} --silent --output /dev/null ${URL})


		case $status_code in
		     000) printf "${printStyle}" "   ${status_code}" "${URL}" "Not responding" | tee log.txt; AlertMail;;
		     100) printf "${printStyle}" "   ${status_code}" "${URL}" "Informational: Continue" ;;
		     101) printf "${printStyle}" "   ${status_code}" "${URL}" "Informational: Switching Protocols";;
		     102) printf "${printStyle}" "   ${status_code}" "${URL}" "Informational: Processing" ;;
		     103) printf "${printStyle}" "   ${status_code}" "${URL}" "Informational: Early Hints" ;;
		     200) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: OK" ;;
		     201) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Created" ;;
		     202) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Accepted" ;;
		     203) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Non-Authoritative Information" ;;
		     204) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: No Content" ;;
		     205) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Reset Content" ;;
		     206) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Partial Content" ;;
		     207) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Multi-Status" ;;
		     208) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: Already Reported" ;;
		     218) printf "${printStyle}" "   ${status_code}" "${URL}" "Apache Web Server: This Is Fine" ;;
		     226) printf "${printStyle}" "   ${status_code}" "${URL}" "Successful: IM Used" ;;
		     300) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Multiple Choices" ;;
		     301) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Moved Permanently" ;;
		     302) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Found residing temporarily under different URI" ;;
		     303) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: See Other" ;;
		     304) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Not Modified" ;;
		     305) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Use Proxy" ;;
		     306) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: status not defined" ;;
		     307) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Temporary Redirect" ;;
		     308) printf "${printStyle}" "   ${status_code}" "${URL}" "Redirection: Permanent Redirect" ;;
		     400) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Bad Request" | tee log.txt; AlertMail;;
		     401) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Unauthorized" | tee log.txt; AlertMail;;
		     402) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Payment Required" | tee log.txt; AlertMail;;
		     403) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Forbidden" | tee log.txt; AlertMail;;
		     404) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Not Found" | tee log.txt; AlertMail;;
		     405) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Method Not Allowed" | tee log.txt; AlertMail;;
		     406) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Not Acceptable" | tee log.txt; AlertMail;;
		     407) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Proxy Authentication Required" | tee log.txt; AlertMail;;
		     408) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Request Timeout" | tee log.txt; AlertMail;;
		     409) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Conflict" | tee log.txt; AlertMail;;
		     410) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Gone" | tee log.txt; AlertMail;;
		     411) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Length Required" | tee log.txt; AlertMail;;
		     412) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Precondition Failed" | tee log.txt; AlertMail;;
		     413) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Request Entity Too Large" | tee log.txt; AlertMail;;
		     414) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Request-URI Too Long" | tee log.txt; AlertMail;;
		     415) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Unsupported Media Type" | tee log.txt; AlertMail;;
		     416) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Requested Range Not Satisfiable" | tee log.txt; AlertMail;;
		     417) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Expectation Failed" | tee log.txt; AlertMail;;
		     418) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: I'm a teapot" | tee log.txt; AlertMail;;
		     419) printf "${printStyle}" "   ${status_code}" "${URL}" "Laravel Framework: Page Expired" | tee log.txt; AlertMail;;
		     420) printf "${printStyle}" "   ${status_code}" "${URL}" "Spring Framework: Method Failure" | tee log.txt; AlertMail;;
		     421) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Misdirected Request" | tee log.txt; AlertMail;;
		     422) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Unprocessable Entity" | tee log.txt; AlertMail;;
		     423) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Locked" | tee log.txt; AlertMail;;
		     424) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Failed Dependency" | tee log.txt; AlertMail;;
		     425) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Too Early" | tee log.txt; AlertMail;;
		     426) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Upgrade Required" | tee log.txt; AlertMail;;
		     428) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Precondition Required" | tee log.txt; AlertMail;;
		     429) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Too Many Requests" | tee log.txt; AlertMail;;
		     430) printf "${printStyle}" "   ${status_code}" "${URL}" "Shopify: Request Header Fields Too Large" | tee log.txt; AlertMail;;
		     431) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Request Header Fields Too Large" | tee log.txt; AlertMail;;
		     440) printf "${printStyle}" "   ${status_code}" "${URL}" "Internet Information Services Error: Login Time-out" | tee log.txt; AlertMail;;
		     444) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: No Response" | tee log.txt; AlertMail;;
		     449) printf "${printStyle}" "   ${status_code}" "${URL}" "Internet Information Services Error: Retry With" | tee log.txt; AlertMail;;
		     450) printf "${printStyle}" "   ${status_code}" "${URL}" "Microsoft: Blocked by Windows Parental Controls" | tee log.txt; AlertMail;;
		     451) printf "${printStyle}" "   ${status_code}" "${URL}" "Client Error: Unavailable For Legal Reasons" | tee log.txt; AlertMail;;
		     460) printf "${printStyle}" "   ${status_code}" "${URL}" "AWS Elastic Load Balancer Error: Client closed the connection with the load balancer before the idle timeout period elapsed." | tee log.txt; AlertMail;;
		     463) printf "${printStyle}" "   ${status_code}" "${URL}" "AWS Elastic Load Balancer Error: The load balancer received an X-Forwarded-For request header with more than 30 IP addresses." | tee log.txt; AlertMail;;
		     494) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: Request Header Too Large" | tee log.txt; AlertMail;;
		     495) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: SSL Certificate Error" | tee log.txt; AlertMail;;
		     496) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: SSL Certificate Required" | tee log.txt; AlertMail;;
		     497) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: HTTP Request Sent to HTTPS Port" | tee log.txt; AlertMail;;
		     498) printf "${printStyle}" "   ${status_code}" "${URL}" "Esri: Invalid Token" | tee log.txt; AlertMail;;
		     499) printf "${printStyle}" "   ${status_code}" "${URL}" "NGINX Error: Client Closed Request" | tee log.txt; AlertMail;;
		     500) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Internal Server Error" | tee log.txt; AlertMail;;
		     501) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Not Implemented" | tee log.txt; AlertMail;;
		     502) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Bad Gateway" | tee log.txt; AlertMail;;
		     503) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Service Unavailable" | tee log.txt; AlertMail;;
		     504) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Gateway Timeout" | tee log.txt; AlertMail;;
		     505) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: HTTP Version Not Supported" | tee log.txt; AlertMail;;
		     506) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Variant Also Negotiates" | tee log.txt; AlertMail;;
		     507) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Insufficient Storage" | tee log.txt; AlertMail;;
		     508) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Loop Detected" | tee log.txt; AlertMail;;
		     509) printf "${printStyle}" "   ${status_code}" "${URL}" "Apache Web Server/cPanel: Bandwidth Limit Exceeded" | tee log.txt; AlertMail;;
		     510) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Not Extended" | tee log.txt; AlertMail;;
		     511) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Network Authentication Required" | tee log.txt; AlertMail;;
		     520) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Web Server Returned an Unknown Error" | tee log.txt; AlertMail;;
		     521) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Web Server Is Down" | tee log.txt; AlertMail;;
		     522) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Connection Timed Out" | tee log.txt; AlertMail;;
		     523) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Origin Is Unreachable" | tee log.txt; AlertMail;;
		     524) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: A Timeout Occurred" | tee log.txt; AlertMail;;
		     525) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: SSL Handshake Failed" | tee log.txt; AlertMail;;
		     526) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Invalid SSL Certificate" | tee log.txt; AlertMail;;
		     527) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: Railgun Error" | tee log.txt; AlertMail;;
		     529) printf "${printStyle}" "   ${status_code}" "${URL}" "Qualys: Site is overloaded" | tee log.txt; AlertMail;;
		     530) printf "${printStyle}" "   ${status_code}" "${URL}" "Cloudflare Error: 1XXX Error" | tee log.txt; AlertMail;;
		     561) printf "${printStyle}" "   ${status_code}" "${URL}" "AWS Elastic Load Balancer Error: Unauthorized" | tee log.txt; AlertMail;;
		     598) printf "${printStyle}" "   ${status_code}" "${URL}" "Server Error: Network read timeout error" | tee log.txt; AlertMail;;
		     *) unknown_status ;;
		esac

done < domain-list.txt
