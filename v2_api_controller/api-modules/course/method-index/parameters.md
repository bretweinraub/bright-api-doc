<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>api_key=[an api key created previously]</td>
	 <td>see [Access Modes](#access-modes)</td>
  </tr>
   <tr>
     <td>api_template</td>
	 <td>api_template=(public|public_minimum)</td>
	 <td>Defines the set of fields that will be returned.  public_minimum is recommended for applications that require higher performance.
	 Web clients are encouraged to use public_minimum whenever possible.</td>
  </tr>
   <tr>
     <td>course_guid</td>
	 <td>?course_guid=ACourseID</td>
	 <td>For a SCORMCloud course, this will match the course ID in scormcloud.
	 See also <a href="http://help.aura-software.com/finding-a-course-id-in-scormcloud/">Finding Your Course ID in SCORMCloud.</a></td>
  </tr>
   <tr>
     <td>include_registrations</td>
     <td>include_registrations=t</td>
	 <td>When access is via accessToken, with an associated user, a nested record showing the user's most recent registration to the course.</td>
  </tr>


</table>

