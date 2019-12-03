* **Your Bright API URL**.  This will be provided to you and is based on where your Bright server is installed, and what
DNS entry is used to access it.  Don't know it?  Ask us at support@aura-software.com!


You should also have your [Bright Realm ID and Secret key](#access-modes/via-realm-id-and-secret-key), which can be obtained from <a href="https://bright.aura-software.com/contact-us/" target="Bright Support">Bright Support</a>.


*Access via SCORM Cloud app ID and secret key is deprecated and not recommended*

If you are using a SCORMCloud course provider, API access can be provided using your SCORMCloud APP ID and secret key.  These are
available from Aura Support, or from the SCORMCloud console available at https://cloud.scorm.com.

* The SCORMCloud APP ID for your SCORMCloud Application.
* The SCORMCloud Secret Key for your SCORMCloud Application.

Here's an example of fetching these values from the SCORMCloud administration console:

![SCORMCloud App](https://content.screencast.com/users/bretweinraub/folders/Jing/media/a0ebfd4c-e41d-41f0-8a80-abc4415ddc42/00000554.png)

You can access this by selection "Apps" from the SCORMCloud administration console left hand menu.

You can also access Bright with a Bright realm app id and key [see section](#access-modes/via-realm-id-and-secret-key).

Certain functionality can only be accessed with a realm key, such as invitations or the utilization of multiple course providers.

For the purposes of this example, we will use the following:

* Bright API URL: https://[BRIGHT URL]/bright/api/v2
* SCORMCloud APPID: **RQIBAXU49I**
* SCORMCloud Secret Key: **nCwrTDSy1MzaeyhN0TFfi3uH3huzlu6CNmyHUG5N**

With the above information, we can already use our API.  To do so, we can test this straight from curl a command line tool that is
easy to install on most systems.

When learning the Bright API, we recommend you start by assembling some simple curl commands from your command line in order to get
a feel for what is possible.

So let's get our list of course from our API:

```shell
curl 'https://[BRIGHT URL]/bright/api/v2/course.xml?sc_app_id=RQIBAXU49I&
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
