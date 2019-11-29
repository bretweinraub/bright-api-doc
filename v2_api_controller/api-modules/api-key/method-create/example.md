```
curl -w "%{http_code}" -d 'sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N
&user_email=admin@aura-software.com' http://[BRIGHT URL]/bright/api/v2/api_key/

{
 "access_token":"a440b1ad868bc76716d22b4b827db77e",
 "created_at":"2012-12-18T12:16:29Z",
 "expires_at":null,
 "id":139,
 "course_provider_id":6,
 "token_type":null,
 "updated_at":"2012-12-18T12:16:29Z",
 "user_id":12
}
201
```
Note that this is a POST request, so you must configure your client appropriately.  In the case of
curl, this is accomplished with the **-d** flag.

The '-w %{http_code}' piece allows you to view the returned HTTP code.


