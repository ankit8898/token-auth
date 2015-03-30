Yet another web app

![Alt text](https://raw.githubusercontent.com/ankit8898/token-auth/master/images/dashboard.png)
## Tech Stack

- AngularJS
- Rails
- ng-token-auth
- devise_token_auth


## Setup

Application comes in two parts

- Client: Angular JS application
- Server: Rails API


## Installation



You have to install both the apps manually .

````ruby
#Installing Client app
$ cd client
$ npm install && bower install 
```
````ruby
#Installing Server app
$ cd server
$ bundle install
$ bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
```
<h4> Running application locally</h4>
Application root has a [Procfile](https://github.com/ankit8898/kt.it/blob/master/Procfile)  that runs both client and server locally . Run application via [foreman](https://github.com/ddollar/foreman)

```
$ foreman start
$ 11:13:17 client.1 | started with pid 4560
$ 11:13:17 server.1 | started with pid 4561

```
