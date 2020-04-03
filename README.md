# Fullstack Coding Challenge
### Description
**Create a simple web application, that fulfills the following stories:**
* As a user, I can register
* As a user, I can log in
* As a user I can upload an image
* As a user I can list my uploaded images with thumbnails

**Work Method:**
* Test Driven
* Use Angular or React
* Use AWS
* Deploy to Heroku
## Installation
### Clone project
Clone project using Git over SSH.
```sh
$ git clone git@github.com:jeandias/devolute-api.git
$ cd devolute-api
```
### Install dependencies for project
```sh
$ bundle install
$ rails db:migrate
```
### Start the server
```sh
$ rails server
```
## Tests API
### Rspec
```sh
$ bundle exec rspec
```
Or run:
```sh
$ bundle exec rspec spec/controllers/api/v1/users_controller_spec.rb
$ bundle exec rspec spec/models/user_spec.rb
```
