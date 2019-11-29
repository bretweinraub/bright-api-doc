The Restful api of bright is built around our main resource types:
  
 * Bright Api Keys (/bright/api/v2/api_key)
 * Course Provider (/bright/api/v2/course_provider)
 * Courses (/bright/api/v2/course)
 * Custom Endpoints (/bright/api/v2/customer/...)
 * Invitations (/bright/api/v2/invitation)
 * Launch Histories (/bright/api/v2/launch_history)
 * Realm User (/bright/api/v2/realm_user)
 * Registrations (/bright/api/v2/registation)
 * Stored Queries (/bright/api/v2/template)
 * Templates (/bright/api/v2/template)
  
for each resource type, we follow the following model, where a specific path, http verb and action are consistent depending on the bright resource you are accessing.

<table>
	<tr>
		<th><span class="caps">HTTP</span> Verb </th>
		<th>Path            </th>
		<th>action </th>
		<th>used for                                   </th>
	</tr>
	<tr>
		<td><span class="caps">GET</span>          </td>
		<td>/{{resource}}           </td>
		<td>index    </td>
		<td>display a list of all {{resource}} [Note: Bright does not implement this canonical REST action].                </td>
	</tr>
	<tr>
		<td><span class="caps">GET</span>          </td>
		<td>/{{resource}}/new       </td>
		<td>new      </td>
		<td>return an <span class="caps">HTML</span> form for creating a new {{resource}} </td>
	</tr>
	<tr>
		<td><span class="caps">POST</span>         </td>
		<td>/{{resource}}           </td>
		<td>create   </td>
		<td>create a new {{resource}}                           </td>
	</tr>
	<tr>
		<td><span class="caps">GET</span>         </td>
		<td>/{{resource}}/gcreate</td>
		<td>create   </td>
		<td>create a new {{resource}} with a GET request.  This is an alias to the POST get request provided to allow the {{resource} to be created from a web browser without using a POST.  A variety of cross-domain scripting issues can be addressed using the GET create alias (gcreate).</td>
	</tr>
	<tr>
		<td><span class="caps">GET</span>          </td>
		<td>/{{resource}}/:id       </td>
		<td>show     </td>
		<td>display a specific {{resource}}                     </td>
	</tr>
	<tr>
		<td><span class="caps">GET</span>          </td>
		<td>/{{resource}}/:id/edit  </td>
		<td>edit     </td>
		<td>return an <span class="caps">HTML</span> form for editing a {{resource}}      </td>
	</tr>
	<tr>
		<td><span class="caps">PUT</span>          </td>
		<td>/{{resource}}/:id       </td>
		<td>update   </td>
		<td>update a specific {{resource}}                      </td>
	</tr>
	<tr>
		<td><span class="caps">GET</span>          </td>
		<td>/{{resource}}/gupdate/:id       </td>
		<td>update   </td>
		<td>update a specific {{resource}} via a GET request.  See the comment on gcreate above.</td>
	</tr>
	<tr>
		<td><span class="caps">DELETE</span>       </td>
		<td>/{{resource}}/:id       </td>
		<td>destroy  </td>
		<td>delete a specific {{resource}}                      </td>
	</tr>
</table>
