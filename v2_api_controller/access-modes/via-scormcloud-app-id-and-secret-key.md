I using the SCORMCloud secret key and app id.  Generally speaking, this is fine
for server side code that is secured and publicly accessible.  You should NEVER share the APP ID and secret key since this give complete access to all of
your data.

Example:

```shell
curl 'https://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=\
RQIBAXU49I&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```

The above example will show all courses for the course provider defined by the SCORMCloud data (app id, secret key).

