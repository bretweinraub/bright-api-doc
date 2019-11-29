In this example, we have a "pts available" field in the course custom
field.

The query below selects out courses that have a number of points
available >= 4.

```shell
wget -qO- 'https://[BRIGHT URL]/bright/api/v2/course.json?[key logic]&
custom_re=points_available\":\"([4-9]|[1-9]([0-9])+)'
```
