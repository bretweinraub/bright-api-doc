Let's say if you are using the API from Javascript, and you'd like your results back as JSON.  Easy, just
rewrite the URL to use 'course.json' instead of 'course.xml'

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?
sc_app_id=RQIBAXU49I&
sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```
And the result (formatted for readibility:

```json
[
 {
	 "created_at":"2012-11-26T12:10:44Z",
	 "id":187,
	 "registrations":2,
	 "course_guid":"1-5098f07394cbd",
	 "course_provider_id":6,
	 "size":1599415,
	 "title":"Proktologie",
	 "updated_at":"2012-11-27T22:30:40Z",
	 "versions":-1
 },
 {
	 "created_at":"2012-11-29T16:11:53Z",
	 "id":200,
	 "registrations":1,
	 "course_guid":"1-50b63e903dd43",
	 "course_provider_id":6,
	 "size":2211931,
	 "title":"Proktologie",
	 "updated_at":"2012-12-07T15:48:43Z",
	 "versions":-1
 }
]
```

