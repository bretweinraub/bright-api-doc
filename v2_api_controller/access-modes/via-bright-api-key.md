The API Key interface allows for the creation of API keys for Bright Server.

If you want to access the Bright API from some browser side Javascript, using the SCORMCloud or Bright Realm secret key is no good.  NEVER put your Secret Key into the browser via Javascript.

Instead the Bright API allows you to create an authentication token that you can use to send to the browser.  When you generate this token, typically you specify

* the SCORMCloud app id/secret key OR bright realm secret key
* optionally the user

These application tokens are disabled after a short period of time.  Do not hard code the use of a Bright API key, as these keys expire after a period of time.  

Here's an example of getting an API token.  This first call creates a special access token to a specific user for a specific SCORMCloud application.  The key that is returned is suitable for 
embedding in a web page for use by browser side Javascript.

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/api_key/create?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N
&user_email=admin@aura-software.com'
(returns) df8d1350a6b31378a86b967767f4bba1
```

You can now omit the secret key and app id from subsequent calls and just use the API key:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.xml?\
api_token=bdb273e9cdace9698c34d97070cb392d'
```
This API token is now "bound" to the access level specified when the key was created.

