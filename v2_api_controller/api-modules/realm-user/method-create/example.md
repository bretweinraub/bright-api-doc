```
curl -w "%{http_code}" 
'https://[BRIGHT URL]/bright/api/v2/realm_user/gcreate.xml?
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
