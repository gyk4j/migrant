REM Not working. Downloading seems to be blocked or made difficult by HashiCorp.

usr\bin\curl ^
-H "accept: */*" ^
-H "accept-encoding: gzip, deflate, br" ^
-H "accept-language: en-US,en;q=0.9" ^
-H "origin: https://portal.cloud.hashicorp.com" ^
-H "referer: https://portal.cloud.hashicorp.com/" ^
-H "sec-ch-ua: \"curl\";v=\"8.12.1\", \"Not_A Brand\";v=\"99\"" ^
-H "sec-ch-ua-mobile: ?0" ^
-H "sec-ch-ua-platform: \"%OS%\"" ^
-H "sec-fetch-dest: empty" ^
-H "sec-fetch-mode: cors" ^
-H "sec-fetch-site: same-site" ^
-H "user-agent: curl/8.12.1" ^
-o boxomatic-alpine-3.20.box ^
https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/boxomatic/box/alpine-3.20/version/20240704.0.1/provider/virtualbox/architecture/amd64/download

REM -H "authorization" ^
REM -H "x-hcp-source-channel: hcp-portal/a6a9cfba" ^
REM -H "x-portal-version: a6a9cfba" ^
