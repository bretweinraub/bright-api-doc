If you receive a 401 code from the API, the server itself has recorded the authentication error in the server log.
If you are completely stumped, this is the place to look.

An error like this should exists:

```shell
Processing by ScormCloudCourseController#index as JSON
  Parameters: {"api_key"=>"bogus!", "course_guid"=>"course1"}
  [1m[36mApiKey Load (0.4ms)[0m  [1mSELECT "api_keys".* FROM 
  "api_keys" WHERE "api_keys"."access_token" = 'bogus!' LIMIT 1[0m
Unauthorized: api token not found
Filter chain halted as :restrict_access rendered or redirected
Completed 401 Unauthorized in 2ms (ActiveRecord: 0.4ms)
```

Definitely give us a shout if you can't get an API call to work at support@aura-software.com.
