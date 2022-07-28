Define services in a docker-compose file
========================================
-   docker-compose.yml
-   To work, this must be in the same directory as a `Dockerfile` file

-   Example:
```yaml
version: "3.9"
services:
  service_name:
    build: .
    ports:
      - "8000:5000"
```
-   `build: .` sets the Dockerfile to handle the build
-   `ports: "8000:5000"` exposes ports 8000 and 5000


----------------------------------------------------------------------------------------------------
Build a docker image from a Dockerfile
======================================
1. Navigate to the directory containing a Dockerfile.

2. Build the docker container with:
```bash
docker build -t “webdev_centos:Dockerfile” .
# Replace “webdev_centos" with the image name you want to give it
# Use `.` to point to the directory that should have the Dockerfile`
```

3. Check that the docker container was built with `docker images`.


----------------------------------------------------------------------------------------------------
Commands
========
## `docker build`
-   Build a new docker image from a Dockerfile

## `docker images`
-   Get a list of docker images available and built
