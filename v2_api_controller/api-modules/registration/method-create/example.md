For a successful request returned will be an XML or JSON document of the SCORMCloud registration.  Note this example is 
using the gcreate alias (using an HTTP get).

```

curl -w "%{http_code}" 
'https://[BRIGHT URL]/bright/api/v2/registration/gcreate.json?
api_key=2a84a6ddb229c13bc945874b69fab8ba&
learner_id=bret@aura-software.com&
course_guid=16-4fbd9ea698bce&
sc_app_id=XXXYYYYZZZ&
sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&
dont_duplicate=t'
{
 "attempts"=>2,
 "complete"=>"complete",
 "course_result"=>'<?xml version="1.0" encoding=...?> <rsp>...</rsp>',
 "crawl_error_msg"=>nil,
 "crawl_status"=>"success",
 "crawl_type"=>"course",
 "created_at"=>"2012-12-21T08:39:12Z",
 "full_result"=>nil,
 "id"=>5336,
 "last_crawled_at"=>"2012-12-12T16:33:33Z",
 "learner_id"=>"bret@aura-software.com",
 "number_of_crawl_errors"=>0,
 "provider_completed_at"=>nil,
 "course_guid"=>"20-NSFoundationPostTrainingQuiz",
 "provider_created_at"=>"2012-12-12T16:32:04Z",
 "deleted"=>nil,
 "provider_errcode"=>nil,
 "provider_error_message"=>nil,
 "provider_accessed_at"=>nil,
 "registration_guid"=>"79c0dd35-139-048258-16e-9a1561b0a85d",
 "score"=>99.2,
 "course_provider_id"=>10,
 "course_id"=>509,
 "success"=>"succeeded",
 "totaltime"=>100.0,
 "updated_at"=>"2012-12-21T08:39:12Z"
}
```
