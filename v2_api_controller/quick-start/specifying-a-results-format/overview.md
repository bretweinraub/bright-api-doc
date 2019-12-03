Regardless of API call you are making, you must *always* specify an interface format when interacting with the Bright API.

This must be specified

 * Append to the URL prior to query parameters, like:

[BRIGHT_URL].(format=xml|json|csv]?query_parameters=....

While in previous software versions, in some cases the request format was inferred, and '.json' could be ommitted, this model is 
deprecated and the request format is now required.

You can also specify the response format via query parameter:

|Parameter|Example|Description|
|--|--|--|
|format|format=(xml\|json\|csv)|Specify the response format|

If you specify both via URL, and query parameter, the behaviour is undefined.



