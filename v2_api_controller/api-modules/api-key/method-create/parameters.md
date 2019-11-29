<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>sc_app_id</td>
    <td></td>
    <td>(optional) <bold>You must use either sc_app_id and sc_secret_key OR realm_guid and realm_secret_key.</bold></td>
   </tr>
   <tr>
    <td>sc_secret_key</td>
    <td></td>
    <td>(optional)</td>
   </tr>
   <tr>
    <td>realm_guid</td>
    <td></td>
    <td>(optional) <bold>You must use either sc_app_id and sc_secret_key OR realm_guid and realm_secret_key.</bold></td>
   </tr>
   <tr>
    <td>realm_secret_key</td>
    <td></td>
    <td>(optional)</td>
   </tr>
   <tr>
    <td>user_email</td>
    <td>user_email=jane.doe@me.com</td>
    <td>(optional).  When specifying a user email when generating an API key, this api key will be "bound" to this user
and will be unable to access data unrelated from the user.  If you do not set user_email, the generated token will have unlimited (administrative) access to
the SCORMCloud application or Bright Realm specified.
<p>
If you specify an email that is new to the system, an account is automatically created for that user,
and the new user is attached as a subscriber class user to the Bright Realm attached to the this SCORM
Cloud application.</td>
   </tr>
</table>		
