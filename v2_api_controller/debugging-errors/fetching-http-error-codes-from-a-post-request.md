Since we use a RESTful API, some operations require a POST HTTP verb.  For whatever reason, the -I flag in curl
will not show you the HTTP return code for a POST.

Instead use the following:

```shell
curl -w "%{http_code}"  -d 'sc_app_id=RQIBAXU49Ix&sc_secret_key=\
nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&user_email=newuser@aura-software.com' \
https://[BRIGHT URL]/bright/api/v2/api_key
```
-w %{http_code} is the key part of that.

