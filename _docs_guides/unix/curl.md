---
---
# curl utility
---

---

## gzip detection

-   Determine size difference between gzipped & regular return data from URL

Example 1 (using local var in command):

```sh
URL='http://webuat.mechanochem.com/api/file/view?path=%2Fmax%2Ftest%2Fdata.json'
curl $URL --silent --write-out "%{size_download}\n" --output /dev/null
curl $URL --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null
```

Example 2 (directly using URL in command):

```sh
curl http://webuat.mechanochem.com --silent --write-out "%{size_download}\n" --output /dev/null
curl http://webuat.mechanochem.com --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null
```

---
