# HTTP workshop challenges

Collection of basic HTTP challenges to test understanding of HTTP for Hack@UCF web workshops. Just some fun basic stuff to knock out.

## Instructions

The following environment variables should be defined:

* CHALLENGE_USER_AGENT
* CHALLENGER_USER_AGENT_FLAG
* CHALLENGE_METHOD_FLAG
* CHALLENGE_VERSION_FLAG

```
# docker build -t http10 .
# docker run -it -p 0.0.0.0:80:80 -e CHALLENGE_USER_AGENT=ua -e CHALLENGE_USER_AGENT_FLAG=ua_flag -e CHALLENGE_METHOD_FLAG=method_flag -e CHALLENGE_VERSION_FLAG=version_flag --name http-challenges workshop-http
```
