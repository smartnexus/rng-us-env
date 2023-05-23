# Instructions of use
**REMEMBER**: Change ```OSM_USER```, ```OSM_PROJECT```, ```OSM_PASSWORD``` in the docker-compose.yml file.

All the data under container folder ```/home/rng``` is mounted to the host machine (data folder under docker compose dir).
```
$ docker compose up -d
$ docker compose exec rng_lab bash
```

To stop the running container and clean all use:
```
$ docker compose down
```