# README

Simple Ruby3 + Rails 6 + Sidekiq + Redis App

Install docker and docker-compose, then run:

* docker-compose build
* docker-compose run web rails db:create
* docker-compose run web rails db:setup
* docker-compose run web rails db:migrate
* docker-compose run web rails db:seed
* docker-compose up

sidekiq path: http://0.0.0.0:3000/sidekiq
login - admin
password - admin
