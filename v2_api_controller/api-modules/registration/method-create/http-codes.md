<table>
  <tr>	
    <th>Code</th>
	<th>Description</th>
  </tr>
  <tr>
    <td>201</td>
	<td>Success; item created</td>
  </tr>		 
  <tr>
    <td>401</td>
	<td>If you do not specify a valid sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP error
401 (unauthorized).</td>
  </tr>		 
  <tr>
    <td>403</td>
	<td>In some cases an additional error message is returned (see below).</td>
  </tr>		 
  <tr>
    <td>404</td>
	<td>You provided a course_guid that can't be found for this access method, or none at all.  If you are using the create (and not gcreate alias),
make sure you are posting the data correctly.</td>
  </tr>		 
  <tr>
    <td>500</td>
	<td>If you specify a user_email that is not valid, or a valid course_guid, you will receive a 500 server error.</td>
  </tr>		 
</table>

In case of errors accessing the SCORMCloud API, a message including the error is returned (error code 403):

```shell
{
"error_code":"4",
"error_message":"The maximum number of registrations has been reached.",
"error_url":"https://cloud.scorm.com/api?email=..."
}
```
Please note if you are using JSONP, since there are limited facillities to capture errors via JSONP, we
will return error code 200, with the error block above.  Otherwise you might find it difficult to correctly
handle this error.
