# Boilerplate for Phoenix Projects

A Template for web app projects using Phoenix Framework 1.3 + Distillery

## What includes?

- Phoenix Framework 1.3 and Elixir 1.4.1
- Distillery for production releases
- Pre hooks for run migrations in production
- Environment variables for settings
- Docker compose setup
- Ready for TDD

## Requirements

- Docker
- Docker Compose
- Cmake

## Considerations for customizations

First you need change some directories names

```
mv src/lib/web_app src/lib/my_project
```

Rename all namespaces in every elixir modules, run this commands inside src folder

```
LC_ALL=C find ./ -type f -exec sed -i '' -e "s/web_app/my_project/" {} \;
LC_ALL=C find ./ -type f -exec sed -i '' -e "s/WebApp/MyProject/" {} \;
```

Edit the Dockerfile and rename all webapp reference

## Run the project for development

### Dependencies

- Install Docker for Mac Os

```shell
Descargar https://download.docker.com/mac/stable/Docker.dmg
```

- Install Docker in Linux

```shell
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

```

- Install cmake in macOS

```shell
brew install cmake
```

- Install cmake in Linux

```shell
apt-get install cmake
```

### Environment

- Just run the next command for build the environment

```shell
make bootstrap
```

- Create a secret keybase and edit the web-secrets.env file

```shell
docker-compose run --rm web mix phx.gen.secret
```

- Test the installation running the service and open **http://localhost**

```shell
docker-compose up web
```

- If you have a pre commit hook for check tests and coverage

```shell
cp script/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### Development commands

- make start
- make restart.web
- make restart.pg
- make stop.web
- make stop.pg
- make logs.web
- make logs.pg
- make shell.web
- make shell.pg
- make credo
- make test
- make coverage

## Make a deployment

Create a new release

    make release

Build a new docker images

    docker build -t <NAME:TAG> .

Submit to a repository

    docker push <NAME:TAG>

If you want test the image you can run __docker run__

    docker run -i --rm
    -e "REPLACE_OS_VARS=true"
    -e "PORT=80"
    -e "HOST=www.myhost.com"
    -e "SECRET_KEY_BASE=my_secret_key_base"
    -e "DB_USERNAME=my_db_username"
    -e "DB_PASSWORD=my_db_password"
    -e "DB_HOST=my_db_host"
    -e "DB_PORT=my_db_port"
    -e "DB_NAME=my_db_name"
    -p 80:80 -n myproject <TAG NAME>
