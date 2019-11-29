The Bright API can be accessed to two different ways:

* [SCORMCloud App ID and Secret Key](#access-modes/via-scormcloud-app-id-and-secret-key)
* [Bright API Key](#access-modes/via-bright-api-key)
* [Brigh Realm GUID and Secret Key](#access-modes-via-realm-id-and-secret-key)

If you do not specify either the api key/secret key pair **OR** the Bright API key, you will
receive HTTP code 401 (Unauthorized) in your response.

If you specify multiple authentication models, you will received a 501 (not implemented).

If you specify an unknown SCORMCloud APPId and Secret key, you will receive a 500 (server error).

The Bright API can be accessed to two different ways:

