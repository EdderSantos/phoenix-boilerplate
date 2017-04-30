##################################################################
#### Development Commands
##################################################################

start:
		docker-compose up -d web

restart.web:
		docker-compose restart web

restart.pg:
		docker-compose restart postgres

stop.web:
		docker-compose stop web

stop.pg:
		docker-compose stop postgres

logs.web:
		docker-compose logs -f web

logs.pg:
		docker-compose logs -f postgres

shell.web:
		docker-compose exec web sh

shell.db:
		docker-compose exec postgres sh

shell.test:
		MIX_ENV=test docker-compose run --rm web sh

seed:
		docker-compose run --rm web sh -c "mix run priv/repo/seeds.exs"

##################################################################
#### Testing Commands
##################################################################

credo:
		MIX_ENV=test docker-compose run --rm web sh -c "mix credo"

test:
		MIX_ENV=test docker-compose run --rm web sh -c "mix test"

coverage:
		MIX_ENV=test docker-compose run --rm web sh -c "mix coveralls"

##################################################################
#### Build and Deployment Commands
##################################################################

bootstrap:
		touch web-secrets.env
		make setup setenv npm.install

setenv:
		echo "DB_PASSWORD=postgres" >> web-secrets.env
		echo "SECRET_KEY_BASE=" >> web-secrets.env

npm.install:
		docker-compose run --rm web sh -c "npm --prefix /app/assets install"

setup:
		docker-compose run --rm web sh -c "mix deps.get \
		&& mix deps.clean --unused \
		&& mix ecto.setup"

release:
		MIX_ENV=prod docker-compose run --rm web sh -c "mix compile \
		&& cd /app/assets;/app/assets/node_modules/brunch/bin/brunch build --production;cd .. \
		&& mix phx.digest \
		&& mix release --no-tar --env=prod"
