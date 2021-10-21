## SITE HTTP STATUS CHECKER

As the title suggests, Bash Script will check site HTTP status code [e.g 200, 403, 404 etc.] and alert you on your email.


## Steps to execute script.

```bash

git clone https://github.com/mayur-chavhan/SITE-STATUS-CHECKER.git

```

```bash 

cd SITE-STATUS-CHECKER

```

Update NOTIFY_TO='user@gmail.com' to your own email address.


Copy sample files domain-list-sample.txt and email-list-sample.txt to domain-list.txt and email-list.txt, Respectively.

``` bash

cp domain-list-sample.txt domain-list.txt

cp email-list-sample.txt email-list.txt

```

Add some domains inside domain-list.txt file,

For example,

```list
google.com
facebook.com
techwhale.in
pikachu.com

```

Update email-list.txt file with your alert email address,

```bash

vim email-list.txt

```

RUN !!

```bash

./check-online-status.sh

```


### Faster Script, HTTP Status Checker bash script

| To use a different similar tool i have built quicker version of site status checker |
|-------------------------------------------------------------------------------------|

RUN !!

```bash
./mini-faster-online-status.sh
```

## Give script to Cron-Job for more efficient mechanics.

I'm hoping if you are already cloned this project in your home directory. for example, /home/your-username/SITE-STATUS-CHECKER

```bash

*/5 * * * * $HOME/SITE-STATUS-CHECKER/check-online-status.sh

```

---------------------------------------------------------------------------------------
## HTTP Status Codes [More About Them Here](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)
This section will tell you what each code from the software means.
## 10.2 Successful 2xx
This class of status code indicates that the client's request was successfully received, understood, and accepted.
### 10.2.1 200 OK
The request has succeeded.
### 10.2.3 202 Accepted
The request has been accepted for processing, but the processing has not been completed.
## 10.5 Server Error 5xx
Response status codes beginning with the digit "5" indicate cases in which the server is aware that it has erred or is incapable of performing the request.
### 10.5.1 500 Internal Server Error
The server encountered an unexpected condition which prevented it from fulfilling the request.
### 10.5.2 501 Not Implemented
The server does not support the functionality required to fulfill the request. This is the appropriate response when the server does not recognize the request method and is not capable of supporting it for any resource.
### 10.5.3 502 Bad Gateway
The server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fulfill the request.
### 10.5.4 503 Service Unavailable
The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.
### 10.5.5 504 Gateway Timeout
The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server specified by the URI or some other auxiliary server it needed to access in attempting to complete the request.
### 10.5.6 505 HTTP Version Not Supported
The server does not support, or refuses to support, the HTTP protocol version that was used in the request message.

## Any Other Questions, Requests, or Problems?
Make an issue if you want to suggest a feature, have a question or have found a bug.
