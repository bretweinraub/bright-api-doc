<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>api_key=[an api key created previously]</td>
	 <td>see <a href="#access-modes">Access Modes</a></td>
  </tr>
  <tr>
   <td>sc_app_id</td>
   <td>sc_app_id=XXXXYYYYZZZ [a valid app ID]</td>
   <td>SCORMCloud application ID (required)</td>
  </tr>

  <tr>
   <td>sc_secret_key</td>
   <td>sc_secret_key=XXXXYYYYZZZ [a valid app secret key]</td>
   <td>SCORMCloud application secret key (required)</td>
  </tr>

  <tr>
   <td>course_guid</td>
   <td>course_guid=16-4fbd9ea698bce</td>
   <td>SCORMCloud course ID (required)</td>
  </tr>
  <tr>
   <td>learner_id</td>
   <td>learner_id=bret@aura-software.com</td>
   <td>email address of user (required)</td>
  </tr>
  <tr>
   <td>dont_duplicate</td>
   <td>dont_duplicate=t</td>
   <td>check for an existing registration for this course and user, just return that if found. (optional)</td>
  </tr>
  <tr>
   <td>check_scorm_cloud</td>
      <td>check_scorm_cloud=t</td>
   <td>check the SCORMCloud API for existing registrations as well as the local Bright database (optional).  This can be useful in test scenarios where Bright SCORMCloud crawler is not functioning, and it is desirable not to create a lot of duplicate registrations.  Typically not used in production.</td>
  </tr>
  <tr>
   <td>fname</td>
   <td>fname=bret</td>
   <td>Can be used to set the first name in the SCORMCloud registration.</td>
  </tr>
  <tr>
   <td>lname</td>
      <td>lname=weinraub</td>
   <td>Can be used to set the last name in the SCORMCloud registration.</td>
  </tr>
</table>
