One thing about the RESTFul architecture is does not interoperate well with cross browser scripting restrictions
in modern browsers.  Specifically, you are probably aware that you can not POST or PUT data via JSONP which means
you can interact with a *pure* RESTFul API from a web page delivered from a web server other the one hosting the
Bright API.

To alleviate this problem, we provide two "GET"-oriented aliases, gcreate and gupdate, that work identically to
create and update, and are available via HTTP GET calls.
