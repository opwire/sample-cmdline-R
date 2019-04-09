# opwire-agent: sample command line in R

## Install

Clone example source code from `github`:

```shell
git clone https://github.com/opwire/sample-cmdline-R.git
```

Change the project home to current working directory:

```shell
cd sample-cmdline-R
```

Start the R interactive console:

```shell
r
```

Following command in R console to install packages:

```shell
install.packages("rjson")
install.packages("argparse")
```

Download and extract the latest [`opwire-agent`](https://github.com/opwire/opwire-agent/releases/latest) program into this directory:

![project-home-dir](https://raw.github.com/opwire/sample-cmdline-R/master/docs/assets/images/ls.png)

## Test the service using a web browser

Execute the following command:

```shell
./opwire-agent serve -p=8888 --default-command="Rscript example.r"
```

Open this URL `http://localhost:8888/$?type=microservice&type=R`:

![example-output](https://raw.github.com/opwire/sample-cmdline-R/master/docs/assets/images/example.png)


## Test the service using `curl`

### Default data format (`json`)

Execute the following command:

```shell
./opwire-agent serve
```

#### Valid input (a JSON object)

Make a HTTP request with `curl`:

```curl
curl -v \
  --request POST \
  --url 'http://localhost:8888/$?type=microservice&type=R' \
  --data '{
  "name": "Opwire",
	"url": "https://opwire.org/"
}'
```

Result:

```plain
> POST /$?type=microservice&type=R HTTP/1.1
> Host: localhost:8888
> User-Agent: curl/7.54.0
> Accept: */*
> Content-Length: 52
> Content-Type: application/x-www-form-urlencoded
> 
* upload completely sent off: 52 out of 52 bytes
< HTTP/1.1 200 OK
< Content-Type: text/plain
< X-Exec-Duration: 1.162727
< Date: Sat, 16 Mar 2019 09:53:30 GMT
< Content-Length: 252
< 
* Connection #0 to host localhost left intact
{"OPWIRE_REQUEST":{"header":{"Accept":"*/*","Content-Length":"52","Content-Type":"application/x-www-form-urlencoded","User-Agent":"curl/7.54.0"},"query":{"type":["microservice","R"]},"params":null},"input":{"name":"Opwire","url":"https://opwire.org/"}}
```

## License

MIT

See [LICENSE](LICENSE) to see the full text.
