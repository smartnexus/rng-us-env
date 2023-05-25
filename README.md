# RNG environment - OSM
## Instructions of use
**REMEMBER**: Change ```OSM_USER```, ```OSM_PROJECT```, ```OSM_PASSWORD``` in the docker-compose.yml file.
```
$ docker compose up -d
$ docker compose exec rng_lab bash
```
To stop the running container and clean all use:
```
$ docker compose down
```

## Accessing files inside container
All the data under container folder ```/home/rng``` is mounted to the host machine (```data``` folder under docker compose working directory).
| Host machine path  |  Container path | 
|---|---|
| $workdir/rng-us-env/data/  | /home/rng/  |   

```$workdir``` is the directory where you downloaded the source code (using git clone o download button from website).

**IMPORTANT:** Do not delete or move host machine ```data/``` folder. Container does not keep files when removed and uses that directory.