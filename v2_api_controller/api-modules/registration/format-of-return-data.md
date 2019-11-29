<table>
<tr><th>Field Name</th><th>Example Data</th><th>Description</th></tr>
<tr><td>attempts</td><td>12</td><td>This is the # of attempts of the course, as recorded in SCORMCloud.</td></tr>
<tr><td>complete</td><td>"complete"</td><td>This is the SCORM 'completion' status as recorded in SCORMCloud.</td></tr>
<tr><td>course_result</td><td>"<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<rsp stat=\"ok\"><registrationreport format=\"course\" regid=\"1-50a38b0d9b2bf_0102b60a8-3bc5-4840-8c90-d1fd01a630c3-65a9ae1bd2f690a3bc789d6a9299b51e\" instanceid=\"0\"><complete>complete</complete><success>failed</success><totaltime>95</totaltime><score>0</score></registrationreport></rsp>"</td><td>The course_result is populated by SCORMCloud and is an XML document that shows the SCORM data collected for the registration.  For the format of the course result, see http://cloud.scorm.com/doc/web-services/api.html#rustici.registration.getRegistrationResult where resultsformat is "course".</td></tr>
<tr><td>crawl_error_msg</td><td></td><td>If there is an error crawling this registration, the error message is listed here.</td></tr>
<tr><td>crawl_status</td><td>"success"</td><td>Last crawl status for the registration.  Used internally in Bright.</td></tr>
<tr><td>crawl_type</td><td>"course"</td><td>Shows the value of "resultsformat" that we used when crawling the registration result.  See also http://cloud.scorm.com/doc/web-services/api.html#rustici.registration.getRegistrationResult</td></tr>
<tr><td>created_at</td><td>"2012-12-21T08:46:36Z"</td><td>The timestamp for the record when created in Bright.  This is not the time the record was created in SCORMCloud.</td></tr>
<tr><td>custom</td><td>{my_custom_data: 1}</td><td>Any user defined custom JSON data.  This data can be used to build custom functionality into your Bright Embedder.</td></tr>
<tr><td>full_result</td><td>null</td><td>If your crawler is running in 'full' mode, (see type), the full results document from http://cloud.scorm.com/doc/web-services/api.html#rustici.registration.getRegistrationResult is available here.</td></tr>
<tr><td>id</td><td>5426</td><td>The Bright internal ID for this registration.</td></tr>
<tr><td>last_crawled_at</td><td>"2012-12-26T14:27:20Z"</td><td>Datetime the record was last crawled.</td></tr>
<tr><td>launched_at</td><td>"2012-12-26T14:27:00Z"</td><td>When this registration is launched from Bright, we maintain a local timestamp of the course launch here.  This timestamp can be used via the Bright API to force a recrawl of the registration (using the refresh_if_launched parameter.) See the Bright API document for more information.</td></tr>
<tr><td>learner_id</td><td>"bret@aura-software.com"</td><td>Email address of the person to whom this registration belongs.</td></tr>
<tr><td>number_of_crawl_errors</td><td>0</td><td>If there is crawl errors, this counter is incremented.</td></tr>
<tr><td>provider_completed_at</td><td>null</td><td>This is the completed_at field as record in SCORMCloud.  SCORMCloud will set this field when it marks the course completed.</td></tr>
<tr><td>course_guid</td><td>"1-50a38b0d9b2bf_0102b60a8-3bc5-4840-8c90-d1fd01a630c3"</td><td>The SCORMCloud Course ID.</td></tr>
<tr><td>provider_created_at</td><td>null</td><td>The timestamp recorded in SCORMCloud as to when the registration was completed.  Typically you would use this when displaying data to the user instead of at, which is internal to Bright.</td></tr>
<tr><td>deleted</td><td>null</td><td>Will be set to a 1 if the registration has been deleted in SCORMCloud.</td></tr>
<tr><td>provider_errcode</td><td>null</td><td>If we receive an error interacting with SCORMCloud for this registration, the error code will be recorded here.</td></tr>
<tr><td>provider_error_message</td><td>null</td><td>Error message received from SCORMCloud when attempting to access this registration.</td></tr>
<tr><td>provider_accessed_at</td><td>null</td><td>The timestamp recorded in SCORMCloud recording the last time the course was accessed.</td></tr>
<tr><td>registration_guid</td><td>"1-50a38b0d9b2bf_0102b60a8-3bc5-4840-8c90-d1fd01a630c3-65a9ae1bd2f690a3bc789d6a9299b51e"</td><td>The SCORMCloud registration ID.</td></tr>
<tr><td>score</td><td>0.0</td><td>This is the score for the registration recorded in SCORMCloud.</td></tr>
<tr><td>scorm_cloud_app_id</td><td>10</td><td>An internal Bright variable corresponding to this SCORMCloud application.</td></tr>
<tr><td>scorm_cloud_course_id</td><td>525</td><td>An internal Bright variable corresponding to this SCORMCloud course.</td></tr>
<tr><td>success</td><td>"failed"</td><td>The value of the registration success field recorded in SCORMCloud.</td></tr>
<tr><td>totaltime</td><td>95.0</td><td>The value of the totaltime field recorded in SCORMCloud.</td></tr>
<tr><td>updated_at</td><td>"2012-12-26T14:27:20Z"</td><td>The last time this record was updated in Bright.</td></tr>
</table>
