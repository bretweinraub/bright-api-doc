Your Bright realm ID and secret key will be furnished to you by Bright support.  For many functions it is not necessary.  If you aren't working
with invitations, creating user records on the fly, or using multiple course providers, you probably won't need a Realm key.  Note you do not
need to create a user to assign a user to a course.  This is done on the fly and if you aren't populating custom metadata for a user, it is 
not necessary to pre-populate the user.

If you need to use a realm ID and secret key, it will be provided to you by Aura support.  You can file a request at support@aura-software.com

For the purposes of this example, we will use the following:

 * realm_guid: sJLtP8Zt8G0Sbz9kxPjQ
 * realm_secret_key: PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w

With these, lets create an api key 'bound' to this authentication level:

```shell
curl 'http://localhost:3000/bright/api/v2/api_key/gcreate?
realm_guid=sJLtP8Zt8G0Sbz9kxPjQ&
realm_secret_key=PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w'
```

And the response:

```shell
{
 "access_token":"2a84a6ddb229c13bc945874b69fab8ba",
 "course_provider_id":null,
 "created_at":"2013-07-03T00:25:37Z",
 "expires_at":null,
 "id":2038,
 "realm_id":4,
 "token_type":null,
 "updated_at":"2013-07-03T00:25:37Z",
 "user_id":null
}
```

We can now use the "access_token" returned as an API key in an insecure situation:

```shell
curl 'http://localhost:3000/bright/api/v2/course?
api_key=2a84a6ddb229c13bc945874b69fab8ba'
```

Or in a secure situation, you can use the realm key directly:

```shell
curl 'http://localhost:3000/bright/api/v2/course?
realm_guid=sJLtP8Zt8G0Sbz9kxPjQ&
realm_secret_key=PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w'
```

