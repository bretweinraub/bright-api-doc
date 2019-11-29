
Using regular expression query is simple with the Bright API.

For controllers that support it,

  * Registration
  * Course

You can specify query paramets like

```shell
curl 'http://[BRIGHT URL]/bright/api/v2/course.json?[key-logic]&
title_re=[a title regular expression]&
title_re=[a second regular expression]&
custom_re=[a matching expression on the custom field]
...
```



