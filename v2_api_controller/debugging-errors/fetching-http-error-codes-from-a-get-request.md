You can see the HTTP response code for a GET request in curl with the -I flag:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?
sc_app_id=RQIBAXU49I&
sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N' -I
 HTTP/1.1 406 Not Acceptable
 Content-Type: text/html; charset=utf-8
 X-Ua-Compatible: IE=Edge,chrome=1
 Cache-Control: no-cache
 X-Request-Id: d4da4e1010b84640e1657b731ada79a3
 X-Runtime: 0.004287
 Date: Fri, 07 Dec 2012 23:04:10 GMT
 X-Rack-Cache: miss
 Content-Length: 0
 Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
 Connection: Keep-Alive
```

You will also get no data from a request that matches no data.  But in this case, the HTTP code will be 200

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I\
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&title=nosuchcourse'
```
[]

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&title=nosuchcourse' -I
  HTTP/1.1 200 OK
  Content-Type: application/json; charset=utf-8
  X-Ua-Compatible: IE=Edge,chrome=1
  Etag: "d751713988987e9331980363e24189ce"
  Cache-Control: max-age=0, private, must-revalidate
  X-Request-Id: 73a4966a2a62ca4e70316f6a68645b51
  X-Runtime: 0.006220
  Date: Fri, 07 Dec 2012 23:06:40 GMT
  X-Rack-Cache: miss
  Content-Length: 0
  Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
  Connection: Keep-Alive
```

