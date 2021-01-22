# Starter files for a Rails 6 dev environment using Docker & Docker Compose

## Setup

1. From your main code directory run the following, replacing your required ruby version

```sh
docker run --rm -it -v "$PWD:/app" ruby:2.7.2 bash
```

2. From inside this container run the following, replacing _my_app_name_ with the name of your app

```sh
gem install rails
cd app
rails new my_app_name -d postgresql --skip-test --skip-bundle --skip-webpack-install
exit
```

4. Copy all the files in this project into your newly created Rails project

5. Add the following lines to your .gitignore

```
# local docker setup
.env
Dockerfile
docker-compose.yml
docker-rails-entrypoint.sh
docker-webpacker-entrypoint.sh
```

6. Edit the project name in the .env file to the name of your app

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
