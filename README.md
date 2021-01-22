# Starter files for setting up a Rails 6 dev environment using docker & docker-compose

## Setup

1. From your main code directory run

```sh
docker run --rm -it -v "$PWD:/app" ruby:2.7.2 bash
```

2. From inside this container run

```sh
gem install rails
cd app
rails new appname -d postgresql --skip-test --skip-bundle --skip-webpack-install
exit
```

4. Copy the all files from here (including the .env) into the newly created Rails project

5. Add the following lines to your .gitignore

```
# local docker setup
Dockerfile
docker-compose.yml
docker-rails-entrypoint.sh
docker-webpacker-entrypoint.sh
.env
```

6. Edit the project name in the .env file

7. Make the entrypoint files executable

```sh
chmod +x docker-rails-entrypoint.sh docker-webpacker-entrypoint.sh
```

8. Build and run the project

```sh
docker-compose up -d --build app
```

9. Wait for all 3 containers to start (app, db and webpacker)

10. App should now be available at http://localhost:4000
