
You can specify a set of fields to be returned by a Bright API call.
This is an alternative method to use the "template=" approach.

To use the fields specification, just include the

     fields=field1,field2,...

query paramters.

For example, on the course controller, when using
'include_registrations', the following is valid:

    fields=course_guid,title,custom,registrations.complete,registrations.registration_guid

