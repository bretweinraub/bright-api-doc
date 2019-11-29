The Bright API, if it's not happy with its input, isn't going to give you that much information as to why.  It doesn't produce error messages
other than HTTP codes.  This is primarily for security reasons.  Since we listen on public ports, we don't want people probing the api, and using
the error messages as a guide to on how to gain access.

From curl, if you put an invalid response, you'll get no data back:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```

We asked for a jsonc format, which of course doesn't exist.

The only information you will get is an HTTP error code, in this case 406, 'Not Acceptable'.

