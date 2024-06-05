# README

* Ruby version
    ruby 3.3.0p0

* Rails version
    rails (~> 7.1.3, >= 7.1.3.3)

* App Initialization
    docker compose build
    docker compose up

* Makefile
    compose = docker compose

    build: ##docker build image
        $(compose) build

    up: ##docker start container
        $(compose) up

    stop: ##docker stop containers
        $(compose) stop

    logs: ##docker logs containers
        $(compose) logs -f -tail=100

    clean: ##docker clean
        $(compose) down --remove-orphans --volumes

    console: ## open console rails container
        $(compose) run app bundle exec rails console

    bash: ## open shell bash in container
        $(compose) run app /bin/bash

* Database creation
    Make Bash
    bundle exec rails dev:setup to drop create migrate and populate database with generic data

* Contact me!
    gabriel.martinsdesouza2@gmail.com