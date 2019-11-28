# Bright V2 API Specification
## Table of Contents
*	 [Introduction](#sec-1)
*	 [General Usage](#sec-2)
*	 [RESTful API](#sec-2-1)
	*	 [List of Available Resources](#sec-2-2)
	*	 [Special Considerations for Cross-Browser Scripting Restrictions](#sec-2-3)
*	 [Quick Start](#sec-3)
		*	 [Prerequisite Data](#sec-3-1)
		*	 [Specifying a results format](#sec-3-2)
			*	 [Fetching an XML result](#sec-3-2-1)
			*	 [Fetching an JSON result](#sec-3-2-2)
*	 [Access Modes](#sec-4)
		*	 [Via SCORMCloud App ID and Secret Key](#sec-4-1)
		*	 [Via Bright API Key](#sec-4-2)
		*	 [Via Realm ID and Secret Key](#sec-4-3)
*	 [API Modules](#sec-5)
		*	 [Registration](#sec-5-1)
			*	 [Method: index](#sec-5-1-1)
				*	 [HTTP Model](#sec-5-1-1-1)
				*	 [parameters](#sec-5-1-1-2)
				*	 [HTTP Codes](#sec-5-1-1-3)
				*	 [Example](#sec-5-1-1-4)
				*	 [Return Data](#sec-5-1-1-5)
			*	 [Method: create](#sec-5-1-2)
				*	 [Parameters](#sec-5-1-2-1)
				*	 [HTTP Codes](#sec-5-1-2-2)
				*	 [Example](#sec-5-1-2-3)
		*	 [Course](#sec-5-2)
			*	 [Method: Index](#sec-5-2-1)
				*	 [HTTP Model:](#sec-5-2-1-1)
				*	 [Parameters](#sec-5-2-1-2)
				*	 [Example](#sec-5-2-1-3)
				*	 [HTTP Codes](#sec-5-2-1-4)
		*	 [Realm User](#sec-5-3)
			*	 [Method: create](#sec-5-3-1)
				*	 [Parameters](#sec-5-3-1-1)
				*	 [HTTP Codes](#sec-5-3-1-2)
				*	 [Example](#sec-5-3-1-3)
			*	 [Method: update (gupdate)](#sec-5-3-2)
				*	 [Parameters](#sec-5-3-2-1)
				*	 [HTTP Codes](#sec-5-3-2-2)
				*	 [Example](#sec-5-3-2-3)
		*	 [API Key](#sec-5-4)
			*	 [Method: create](#sec-5-4-1)
				*	 [HTTP Model:](#sec-5-4-1-1)
				*	 [Parameters](#sec-5-4-1-2)
				*	 [Return Data](#sec-5-4-1-3)
				*	 [Example:](#sec-5-4-1-4)
				*	 [HTTP Codes](#sec-5-4-1-5)
*	 [Debugging Errors](#sec-6)
		*	 [Fetching HTTP Error Codes from a GET Request](#sec-6-1)
		*	 [Fetching HTTP Error Codes from a POST Request](#sec-6-2)
		*	 [Debugging Authentication Errors](#sec-6-3)

<a name="introduction"></a>
<a name="sec-1"></a>
## 1. Introduction

This document describes how to use version 2 of the Bright API.

The Bright API provides programmatic access to a variety of functions provided by the Bright platform, most
significantly read and write access to the Bright database.  Via the API it is possible to register users, assign
courses, generate launch URLs, and query results.

This document details how to get connected to the Bright Server, how to authenticate, and what functions
are available via which API calls.  It also covers what to do when things go wrong, and how to get more information.

More information about Bright and the Bright platform can be accessed from the [Aura Homepage](http://www.aura-software.com).


<a name="general-usage"></a>
<a name="sec-2"></a>
## 2. General Usage

The Bright API is used to interact with Bright Server.  Typical things you might do with Bright are

* access data about learners, courses, registrations.
* You might be querying data or pushing data in.

Regardless, all Bright API calls function in the same way.
Fundamentally, the Bright API is a RESTful API, so much of what is covered here should seem familiar if you've worked
with a RESTful API before.  If not, you may want to familiarize yourself with the concepts here:
http://en.wikipedia.org/wiki/Representational_state_transfer .

![](http://content.screencast.com/users/bretweinraub/folders/Jing/media/65b3da97-8fc0-47da-bc21-77159d7021c7/00000306.png)
Source: [Wikipedia](http://en.wikipedia.org/wiki/Representational_state_transfer)



<a name="general-usage-restful-api"></a>
<a name="sec-2-1"></a>
### 2.1. RESTful API

The Restful api of bright is built around our main resource types:
  
  * courses
  * registrations
  * users
  * api keys
  * invitations

for each resource type, we follow the following model, where a specific path, http verb and action are consistent depending on the bright
resource you are accessing.

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


<a name="general-usage-list-of-available-resources"></a>
<a name="sec-2-2"></a>
### 2.2. List of Available Resources

* Bright Api Keys (/bright/api/v2/api_key)
* Course Provider (/bright/api/v2/course_provider)
* Courses (/bright/api/v2/course)
* Registrations (/bright/api/v2/registation)
* Realm User (/bright/api/v2/realm_user)
* Embed Templates (/bright/api/v2/embed_template) [Note: in v3, this will be renamed simply "template"].
* Invitations (/bright/api/v2/invitation)


<a name="general-usage-special-considerations-for-cross-browser-scripting-restrictions"></a>
<a name="sec-2-3"></a>
### 2.3. Special Considerations for Cross-Browser Scripting Restrictions

One thing about the RESTFul architecture is does not interoperate well with cross browser scripting restrictions
in modern browsers.  Specifically, you are probably aware that you can not POST or PUT data via JSONP which means
you can interact with a *pure* RESTFul API from a web page delivered from a web server other the one hosting the
Bright API.

To alleviate this problem, we provide two "GET"-oriented aliases, gcreate and gupdate, that work identically to
create and update, and are available via HTTP GET calls.


<a name="quick-start"></a>
<a name="sec-3"></a>
## 3. Quick Start

In the section we will quickly work throw the steps of connecting to the Bright API, authenticating, and generating
API calls.


<a name="quick-start-prerequisite-data"></a>
<a name="sec-3-1"></a>
### 3.1. Prerequisite Data

* Your Bright API URL.  This will be provided to you and is based on where your Bright server is installed, and what
DNS entry is used to access it.  Don't know it?  Ask us at support@aura-software.com!

If you are using a SCORMCloud course provider, API access can be provided using your SCORMCloud APP ID and secret key.  These are
available from Aura Support, or from the SCORMCloud console available at https://cloud.scorm.com.

* The SCORMCloud APP ID for your SCORMCloud Application.
* The SCORMCloud Secret Key for your SCORMCloud Application.

Here's an example of fetching these values from the SCORMCloud administration console:

![SCORMCloud App](http://content.screencast.com/users/bretweinraub/folders/Jing/media/a0ebfd4c-e41d-41f0-8a80-abc4415ddc42/00000554.png)

You can access this by selection "Apps" from the SCORMCloud administration console left hand menu.

You can also access Bright with a Bright realm app id and key [see section](#access-modes/via-realm-id-and-secret-key).

Certain functionality can only be accessed with a realm key, such as invitations or the utilization of multiple course providers.

For the purposes of this example, we will use the following:

* Bright API URL: http://[BRIGHT URL]/bright/api/v2
* SCORMCloud APPID: **RQIBAXU49I**
* SCORMCloud Secret Key: **nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N**

With the above information, we can already use our API.  To do so, we can test this straight from curl a command line tool that is
easy to install on most systems.

When learning the Bright API, we recommend you start by assembling some simple curl commands from your command line in order to get
a feel for what is possible.

So let's get our list of course from our API:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.xml?sc_app_id=RQIBAXU49I&
sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```

If you've executed this correctly, you'll get a result like:

And the result:

```xml

  <?xml version="1.0" encoding="UTF-8"?>
  <scorm-cloud-courses type="array">
    <scorm-cloud-course>
      <course-provider-id type="integer">6</course-provider-id>
      <created-at type="datetime">2012-11-26T12:10:40Z</created-at>
      <custom></custom>
      <id type="integer">184</id>
      <metadata>{"title":"ENT Foundation - Post Training QUIZ",
	             "description":"",
				 "duration":"0",
				 "typicaltime":"0",
				 "keywords":null}
 	  </metadata>
      <registration-count type="integer">1</registration-count>
      <sc-course-id>1-507727747154e</sc-course-id>
      <size type="integer">157758</size>
      <title>System Test Course</title>
      <updated-at type="datetime">2013-01-17T16:20:10Z</updated-at>
      <versions type="integer">-1</versions>
    </scorm-cloud-course>
  </scorm-cloud-courses>
```


<a name="quick-start-specifying-a-results-format"></a>
<a name="sec-3-2"></a>
### 3.2. Specifying a results format




<a name="quick-start-specifying-a-results-format-fetching-an-xml-result"></a>
<a name="sec-3-2-1"></a>
#### 3.2.1. Fetching an XML result

To fetch your results in XML format, append a '.xml' to the url, *before* the request parameters.  For example

```
http://[BRIGHT URL]/bright/api/v2/course.xml
```



<a name="quick-start-specifying-a-results-format-fetching-an-json-result"></a>
<a name="sec-3-2-2"></a>
#### 3.2.2. Fetching an JSON result

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
	 "sc_course_id":"1-5098f07394cbd",
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
	 "sc_course_id":"1-50b63e903dd43",
	 "course_provider_id":6,
	 "size":2211931,
	 "title":"Proktologie",
	 "updated_at":"2012-12-07T15:48:43Z",
	 "versions":-1
 }
]
```



<a name="access-modes"></a>
<a name="sec-4"></a>
## 4. Access Modes

The Bright API can be accessed to two different ways:

* [SCORMCloud App ID and Secret Key](#access-modes/via-scormcloud-app-id-and-secret-key)
* [Bright API Key](#access-modes/via-bright-api-key)
* [Brigh Realm GUID and Secret Key) (#access-modes/via-realm-guid-and-secret-key)

If you do not specify either the api key/secret key pair **OR** the Bright API key, you will
receive HTTP code 401 (Unauthorized) in your response.

If you specify multiple authentication models, you will received a 501 (not implemented).

If you specify an unknown SCORMCloud APPId and Secret key, you will receive a 500 (server error).

The Bright API can be accessed to two different ways:



<a name="access-modes-via-scormcloud-app-id-and-secret-key"></a>
<a name="sec-4-1"></a>
### 4.1. Via SCORMCloud App ID and Secret Key

I using the SCORMCloud secret key and app id.  Generally speaking, this is fine
for server side code that is secured and publicly accessible.  You should NEVER share the APP ID and secret key since this give complete access to all of
your data.

Example:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=\
RQIBAXU49I&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```

The above example will show all courses for the course provider defined by the SCORMCloud data (app id, secret key).



<a name="access-modes-via-bright-api-key"></a>
<a name="sec-4-2"></a>
### 4.2. Via Bright API Key

The API Key interface allows for the creation of API keys for Bright Server.

If you want to access the Bright API from some browser side Javascript, using the SCORMCloud or Bright Realm secret key is no good.  NEVER put your Secret Key into the browser via Javascript.

Instead the Bright API allows you to create an authentication token that you can use to send to the browser.  When you generate this token, typically you specify

* the SCORMCloud app id/secret key OR bright realm secret key
* optionally the user

These application tokens are disabled after a short period of time.  Do not hard code the use of a Bright API key, as these keys expire after a period of time.  

Here's an example of getting an API token.  This first call creates a special access token to a specific user for a specific SCORMCloud application.  The key that is returned is suitable for 
embedding in a web page for use by browser side Javascript.

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/api_key/create?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N
&user_email=admin@aura-software.com'
(returns) df8d1350a6b31378a86b967767f4bba1
```

You can now omit the secret key and app id from subsequent calls and just use the API key:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.xml?\
api_token=bdb273e9cdace9698c34d97070cb392d'
```
This API token is now "bound" to the access level specified when the key was created.



<a name="access-modes-via-realm-id-and-secret-key"></a>
<a name="sec-4-3"></a>
### 4.3. Via Realm ID and Secret Key

Your Bright realm ID and secret key will be furnished to you by Bright support.  For many functions it is not necessary.  If you aren't working
with invitations, creating user records on the fly, or using multiple course providers, you probably won't need a Realm key.  Note you do not
need to create a user to assign a user to a course.  This is done on the fly and if you aren't populating custom metadata for a user, it is 
not necessary to pre-populate the user.

If you need to use a realm ID and secret key, it will be provided to you by Aura support.  You can file a request at support@aura-software.com

For the purposes of this example, we will use the following:

 * realm_guid: sJLtP8Zt8G0Sbz9kxPjQ
 * realm_secret_key: PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w

With these, lets create an api key 'bound' to this authentication level:

```shell
curl 'http://localhost:3000/bright/api/v2/api_key/gcreate?
realm_guid=sJLtP8Zt8G0Sbz9kxPjQ&
realm_secret_key=PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w'
```

And the response:

```shell
{
 "access_token":"2a84a6ddb229c13bc945874b69fab8ba",
 "course_provider_id":null,
 "created_at":"2013-07-03T00:25:37Z",
 "expires_at":null,
 "id":2038,
 "realm_id":4,
 "token_type":null,
 "updated_at":"2013-07-03T00:25:37Z",
 "user_id":null
}
```

We can now use the "access_token" returned as an API key in an insecure situation:

```shell
curl 'http://localhost:3000/bright/api/v2/course?
api_key=2a84a6ddb229c13bc945874b69fab8ba'
```

Or in a secure situation, you can use the realm key directly:

```shell
curl 'http://localhost:3000/bright/api/v2/course?
realm_guid=sJLtP8Zt8G0Sbz9kxPjQ&
realm_secret_key=PcVQflTCUIbe3ps2T86KXAzvXzdpFcgs5Mvku03uZ8w'
```



<a name="api-modules"></a>
<a name="sec-5"></a>
## 5. API Modules

Note not all RESTFul function are implemented.



<a name="api-modules-registration"></a>
<a name="sec-5-1"></a>
### 5.1. Registration




<a name="api-modules-registration-method-index"></a>
<a name="sec-5-1-1"></a>
#### 5.1.1. Method: index

The index method allows the api user to query registrations.



<a name="api-modules-registration-method-index-http-model"></a>
<a name="sec-5-1-1-1"></a>
##### 5.1.1.1. HTTP Model


<table>
  <tr>
    <th>Verb</th>
	<th>Form</th>
  </tr>	
  <tr>
    <td>GET</td>
    <td>(http|https)://BRIGHT_URL/bright/api/v2/registration[.format]?param1=value1&...</td>
  </tr>
</table>


<a name="api-modules-registration-method-index-parameters"></a>
<a name="sec-5-1-1-2"></a>
##### 5.1.1.2. parameters

<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>One of:
<table>
  <tr>
    <td>api_key=xxxxxxxxxx [an api key created previously]</td>
  </tr>
  <tr>
    <td>sc_app_id=XXXXXXXXX&sc_secret_key=YYYYYYYYYYY [a valid SCORMCloud app ID/secret key pair]</td>
  </tr>
  <tr>
    <td>realm_guid=XXXXXXXXX&realm_secret_key=YYYYYYYYYY [a valid Bright Realm GUID/secret key pair]</td>
  </tr>
</table></td>  
	 <td>see [Access Modes](#access-modes)</td>
  </tr>

  <tr>
    <td><pre>last_only</pre></td>
	<td>last_only=t</td>
	<td>when included in the parameter string, we will return a single registration record, that being the last one created.  Useful in cases where multiple registrations are found and only the most recent one should be returned.</td>
  </tr>	

  <tr>
    <td><pre>sc_course_id</pre></td>
	<td>sc_course_id=[a scorm cloud course id]</td>
	<td>filter results to just this SCORMCloud course ID</td>
  </tr>	

  <tr>
    <td><pre>learner_id</pre></td>
	<td>learner_id=jane.doe@me.com</td>
	<td>filter results to just this email address.</td>
  </tr>	

  <tr>
    <td><pre>refresh_if_launched</pre></td>
	<td>refresh_if_launched=t</td>
	<td>if the last launch date of this registration is newer than the last crawl date, this will force the record to recrawl prior to returning a result.</td>
  </tr>	

  <tr>
    <td><pre>crawl</pre></td>
	<td>crawl=t</td>
	<td>forces the registration to recrawl</td>
  </tr>	
</table>

<a name="api-modules-registration-method-index-http-codes"></a>
<a name="sec-5-1-1-3"></a>
##### 5.1.1.3. HTTP Codes

<table>
  <tr>	
    <th>Code</th>
	<th>Description</th>
  </tr>

  <tr>
    <td>200</td>
	<td>Success; items returned</td>
  </tr>		 

  <tr>
    <td>401</td>
	<td>If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP</td>
  </tr>		 

  <tr>
    <td>500</td>
	<td>An illegal request, such as a malformed argument</td>
  </tr>		 

</table>


<a name="api-modules-registration-method-index-example"></a>
<a name="sec-5-1-1-4"></a>
##### 5.1.1.4. Example

```
curl -w "%{http_code}" 'http://localhost:3000/bright/api/v2/registration.json?
api_key=2a84a6ddb229c13bc945874b69fab8ba&
learner_id=bret@aura-software.com&
sc_course_id=16-4fbd9ea698bce
```


<a name="api-modules-registration-method-index-return-data"></a>
<a name="sec-5-1-1-5"></a>
##### 5.1.1.5. Return Data



<a name="api-modules-registration-method-create"></a>
<a name="sec-5-1-2"></a>
#### 5.1.2. Method: create

Creates a new registration.  Can be used in a single call that can be used to return an existing registration if
one exists, or create a new one if it does not.



<a name="api-modules-registration-method-create-parameters"></a>
<a name="sec-5-1-2-1"></a>
##### 5.1.2.1. Parameters

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
   <td>sc_course_id</td>
   <td>sc_course_id=16-4fbd9ea698bce</td>
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


<a name="api-modules-registration-method-create-http-codes"></a>
<a name="sec-5-1-2-2"></a>
##### 5.1.2.2. HTTP Codes

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
	<td>You provided a sc_course_id that can't be found for this access method, or none at all.  If you are using the create (and not gcreate alias),
make sure you are posting the data correctly.</td>
  </tr>		 
  <tr>
    <td>500</td>
	<td>If you specify a user_email that is not valid, or a valid sc_course_id, you will receive a 500 server error.</td>
  </tr>		 
</table>

In case of errors accessing the SCORMCloud API, a message including the error is returned (error code 403):

```shell
{
"error_code":"4",
"error_message":"The maximum number of registrations has been reached.",
"error_url":"http://cloud.scorm.com/api?email=..."
}
```
Please note if you are using JSONP, since there are limited facillities to capture errors via JSONP, we
will return error code 200, with the error block above.  Otherwise you might find it difficult to correctly
handle this error.


<a name="api-modules-registration-method-create-example"></a>
<a name="sec-5-1-2-3"></a>
##### 5.1.2.3. Example

For a successful request returned will be an XML or JSON document of the SCORMCloud registration.  Note this example is 
using the gcreate alias (using an HTTP get).

```

curl -w "%{http_code}" 
'http://localhost:3000/bright/api/v2/registration/gcreate.json?
api_key=2a84a6ddb229c13bc945874b69fab8ba&
learner_id=bret@aura-software.com&
sc_course_id=16-4fbd9ea698bce&
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
 "sc_completed_at"=>nil,
 "sc_course_id"=>"20-NSFoundationPostTrainingQuiz",
 "sc_created_at"=>"2012-12-12T16:32:04Z",
 "sc_deleted"=>nil,
 "sc_err_code"=>nil,
 "sc_error_message"=>nil,
 "sc_last_accessed_at"=>nil,
 "sc_registration_id"=>"79c0dd35-139-048258-16e-9a1561b0a85d",
 "score"=>99.2,
 "course_provider_id"=>10,
 "course_id"=>509,
 "success"=>"succeeded",
 "totaltime"=>100.0,
 "updated_at"=>"2012-12-21T08:39:12Z"
}
```


<a name="api-modules-course"></a>
<a name="sec-5-2"></a>
### 5.2. Course





<a name="api-modules-course-method-index"></a>
<a name="sec-5-2-1"></a>
#### 5.2.1. Method: Index

The index method allows the api user to fetch a course list.


<a name="api-modules-course-method-index-http-model"></a>
<a name="sec-5-2-1-1"></a>
##### 5.2.1.1. HTTP Model:

<table>
  <tr>
    <th>Verb</th>
	<th>Form</th>
  </tr>	
  <tr>
    <td>GET</td>
    <td>(http|https)://BRIGHT_URL/bright/api/v2/course[.format]?param1=value1&...</td>
  </tr>
</table>


<a name="api-modules-course-method-index-parameters"></a>
<a name="sec-5-2-1-2"></a>
##### 5.2.1.2. Parameters

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
</table>



<a name="api-modules-course-method-index-example"></a>
<a name="sec-5-2-1-3"></a>
##### 5.2.1.3. Example

```
curl -w "%{http_code}" 'http://localhost:3000/bright/api/v2/course.json?
learner_id=bret@aura-software.com&
sc_course_id=16-4fbd9ea698bce
```


<a name="api-modules-course-method-index-http-codes"></a>
<a name="sec-5-2-1-4"></a>
##### 5.2.1.4. HTTP Codes

<table>
  <tr>	
    <th>Code</th>
	<th>Description</th>
  </tr>
  <tr>
    <td>200</td>
	<td>Success; items returned</td>
  </tr>		 
  <tr>
    <td>401</td>
	<td>If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP error
401 (unauthorized).</td>
  </tr>		 
  <tr>
    <td>500</td>
	<td>An illegal request, such as a malformed argument.</td>
  </tr>		 
</table>


<a name="api-modules-realm-user"></a>
<a name="sec-5-3"></a>
### 5.3. Realm User

For learners, its generally not necessary to prepopulate realm users as creating a registration implicitly creates the user.

It is possible to create them via the API and also manipulate their custom field as well.



<a name="api-modules-realm-user-method-create"></a>
<a name="sec-5-3-1"></a>
#### 5.3.1. Method: create

Creates a new realm user.  You must use a realm guid and secret key (or api key creating bound to a realm key) to create a realm user.


<a name="api-modules-realm-user-method-create-parameters"></a>
<a name="sec-5-3-1-1"></a>
##### 5.3.1.1. Parameters

<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>api_key=[an api key created previously]</td>
	 <td>see <a href="#access-modes">Access Modes.  You cannot use a SCORMCloud app-id/secret key or user bound api key to create a realm user.</a></td>
  </tr>
  <tr>
   <td>email</td>
   <td>email=bret@aura-software.com</td>
   <td>email address of the user (required)</td>
  </tr>
  <tr>
    <td>realm_role_id</td>
    <td>realm_role_id=1</td>
	<td>Define the realm role.  Not required, defaults to '1' (learner).  </td>
  </tr>  
  <tr>
    <td>custom</td>
	<td>custom='{this:that}'</td>
	<td>Define a custom field for this user.  Custom fields are freeform metadata available to be defined for the user.</td>
  </tr>
</table>



<a name="api-modules-realm-user-method-create-http-codes"></a>
<a name="sec-5-3-1-2"></a>
##### 5.3.1.2. HTTP Codes

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
    <td>302</td>
	<td>Item already exists, not modified.</td>
  </tr>		 
  <tr>
    <td>500</td>
	<td>If you specify a user_email that is not valid, or a valid sc_course_id, you will receive a 500 server error.</td>
  </tr>		 
</table>


<a name="api-modules-realm-user-method-create-example"></a>
<a name="sec-5-3-1-3"></a>
##### 5.3.1.3. Example

```
curl -w "%{http_code}" 
'http://localhost:3000/bright/api/v2/realm_user/gcreate.xml?
api_key=2a84a6ddb229c13bc945874b69fab8ba&
email=bretx@aura-software.com&
custom=foo'
<?xml version="1.0" encoding="UTF-8"?>
<realm-user>
  <created-at type="datetime">2013-07-03T05:26:21Z</created-at>
  <custom>foo</custom>
  <id type="integer">1743</id>
  <realm-id type="integer">4</realm-id>
  <realm-role-id type="integer">1</realm-role-id>
  <updated-at type="datetime">2013-07-03T05:26:21Z</updated-at>
  <user-id type="integer">1686</user-id>
</realm-user>
201
```


<a name="api-modules-realm-user-method-update-gupdate"></a>
<a name="sec-5-3-2"></a>
#### 5.3.2. Method: update (gupdate)

Update a realm user.  You must use a realm guid and secret key (or api key creating bound to a realm key) to update a realm user.



<a name="api-modules-realm-user-method-update-gupdate-parameters"></a>
<a name="sec-5-3-2-1"></a>
##### 5.3.2.1. Parameters

<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>api_key=[an api key created previously]</td>
	 <td>see <a href="#access-modes">Access Modes.  You cannot use a SCORMCloud app-id/secret key or user bound api key to create a realm user.</a></td>
  </tr>
  <tr>
   <td>email</td>
   <td>email=bret@aura-software.com</td>
   <td>email address of the user (required)</td>
  </tr>
  <tr>
    <td>custom</td>
	<td>custom='{this:that}'</td>
	<td>Define a custom field for this user.  Custom fields are freeform metadata available to be defined for the user.</td>
  </tr>
</table>



<a name="api-modules-realm-user-method-update-gupdate-http-codes"></a>
<a name="sec-5-3-2-2"></a>
##### 5.3.2.2. HTTP Codes

<table>
  <tr>	
    <th>Code</th>
	<th>Description</th>
  </tr>
  <tr>
    <td>200</td>
	<td>Success; item created</td>
  </tr>		 
  <tr>
    <td>404</td>
	<td>Realm user cannot be found..</td>
  </tr>		 
  <tr>
    <td>500</td>
	<td>If you specify a user_email that is not valid, or supply unexpected parameters, you will receive a 500 server error.</td>
  </tr>		 
</table>


<a name="api-modules-realm-user-method-update-gupdate-example"></a>
<a name="sec-5-3-2-3"></a>
##### 5.3.2.3. Example

```
curl -w "%{http_code}" 
'http://localhost:3000/bright/api/v2/realm_user/gupdate.xml?
api_key=2a84a6ddb229c13bc945874b69fab8ba&
email=bretx@aura-software.com&
custom=foox'
200
```


<a name="api-modules-api-key"></a>
<a name="sec-5-4"></a>
### 5.4. API Key

The API Key interface allows for the creation of API keys for Bright Server.



<a name="api-modules-api-key-method-create"></a>
<a name="sec-5-4-1"></a>
#### 5.4.1. Method: create


Create a new API key.


<a name="api-modules-api-key-method-create-http-model"></a>
<a name="sec-5-4-1-1"></a>
##### 5.4.1.1. HTTP Model:

<table>
  <tr>
    <th>Verb</th>
	<th>Form</th>
  </tr>	
  <tr>
    <td>Post</td>
    <td>(http|https)://BRIGHT_URL/bright/api/v2/api_key?param1=value1&...</td>
  </tr>
</table>


<a name="api-modules-api-key-method-create-parameters"></a>
<a name="sec-5-4-1-2"></a>
##### 5.4.1.2. Parameters

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


<a name="api-modules-api-key-method-create-return-data"></a>
<a name="sec-5-4-1-3"></a>
##### 5.4.1.3. Return Data

Returns a JSON document of the new record.  HTTP Code is set to 201 (item created).



<a name="api-modules-api-key-method-create-example"></a>
<a name="sec-5-4-1-4"></a>
##### 5.4.1.4. Example:

```
curl -w "%{http_code}" -d 'sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N
&user_email=admin@aura-software.com' http://[BRIGHT URL]/bright/api/v2/api_key/

{
 "access_token":"a440b1ad868bc76716d22b4b827db77e",
 "created_at":"2012-12-18T12:16:29Z",
 "expires_at":null,
 "id":139,
 "course_provider_id":6,
 "token_type":null,
 "updated_at":"2012-12-18T12:16:29Z",
 "user_id":12
}
201
```
Note that this is a POST request, so you must configure your client appropriately.  In the case of
curl, this is accomplished with the **-d** flag.

The '-w %{http_code}' piece allows you to view the returned HTTP code.




<a name="api-modules-api-key-method-create-http-codes"></a>
<a name="sec-5-4-1-5"></a>
##### 5.4.1.5. HTTP Codes

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
    <td>500</td>
	<td>If you specify a user_email that is not valid, you will receive a 500 server error.</td>
  </tr>		 
</table>


<a name="debugging-errors"></a>
<a name="sec-6"></a>
## 6. Debugging Errors

The Bright API, if it's not happy with its input, isn't going to give you that much information as to why.  It doesn't produce error messages
other than HTTP codes.  This is primarily for security reasons.  Since we listen on public ports, we don't want people probing the api, and using
the error messages as a guide to on how to gain access.

From curl, if you put an invalid response, you'll get no data back:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N'
```

We asked for a jsonc format, which of course doesn't exist.

The only information you will get is an HTTP error code, in this case 406, 'Not Acceptable'.



<a name="debugging-errors-fetching-http-error-codes-from-a-get-request"></a>
<a name="sec-6-1"></a>
### 6.1. Fetching HTTP Error Codes from a GET Request

You can see the HTTP response code for a GET request in curl with the -I flag:

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?
sc_app_id=RQIBAXU49I&
sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N' -I
 HTTP/1.1 406 Not Acceptable
 Content-Type: text/html; charset=utf-8
 X-Ua-Compatible: IE=Edge,chrome=1
 Cache-Control: no-cache
 X-Request-Id: d4da4e1010b84640e1657b731ada79a3
 X-Runtime: 0.004287
 Date: Fri, 07 Dec 2012 23:04:10 GMT
 X-Rack-Cache: miss
 Content-Length: 0
 Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
 Connection: Keep-Alive
```

You will also get no data from a request that matches no data.  But in this case, the HTTP code will be 200

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I\
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&title=nosuchcourse'
```
[]

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?sc_app_id=RQIBAXU49I
&sc_secret_key=nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&title=nosuchcourse' -I
  HTTP/1.1 200 OK
  Content-Type: application/json; charset=utf-8
  X-Ua-Compatible: IE=Edge,chrome=1
  Etag: "d751713988987e9331980363e24189ce"
  Cache-Control: max-age=0, private, must-revalidate
  X-Request-Id: 73a4966a2a62ca4e70316f6a68645b51
  X-Runtime: 0.006220
  Date: Fri, 07 Dec 2012 23:06:40 GMT
  X-Rack-Cache: miss
  Content-Length: 0
  Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
  Connection: Keep-Alive
```



<a name="debugging-errors-fetching-http-error-codes-from-a-post-request"></a>
<a name="sec-6-2"></a>
### 6.2. Fetching HTTP Error Codes from a POST Request

Since we use a RESTful API, some operations require a POST HTTP verb.  For whatever reason, the -I flag in curl
will not show you the HTTP return code for a POST.

Instead use the following:

```shell
curl -w "%{http_code}"  -d 'sc_app_id=RQIBAXU49Ix&sc_secret_key=\
nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N&user_email=newuser@aura-software.com' \
http://[BRIGHT URL]/bright/api/v2/api_key
```
-w %{http_code} is the key part of that.



<a name="debugging-errors-debugging-authentication-errors"></a>
<a name="sec-6-3"></a>
### 6.3. Debugging Authentication Errors

If you receive a 401 code from the API, the server itself has recorded the authentication error in the server log.
If you are completely stumped, this is the place to look.

An error like this should exists:

```shell
Processing by ScormCloudCourseController#index as JSON
  Parameters: {"api_key"=>"bogus!", "sc_course_id"=>"course1"}
  [1m[36mApiKey Load (0.4ms)[0m  [1mSELECT "api_keys".* FROM 
  "api_keys" WHERE "api_keys"."access_token" = 'bogus!' LIMIT 1[0m
Unauthorized: api token not found
Filter chain halted as :restrict_access rendered or redirected
Completed 401 Unauthorized in 2ms (ActiveRecord: 0.4ms)
```

Definitely give us a shout if you can't get an API call to work at support@aura-software.com.

