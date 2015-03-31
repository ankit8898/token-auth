## Blog

Implementation with a token based auth

<h5>Access directly on heroku instance</h5>

<b>url:</b> http://univ-mon.herokuapp.com/#/login <br/>
<b>username/password:</b> ankit@a.com/P@ssword OR dan@a.com/P@ssw0rd

<i>Screen 1</i>
![Alt text](https://raw.githubusercontent.com/PracticallyGreen/gupta-interview2/master/images/login.png?token=AAZwl0-T1kbLyT62tsSxQsU-E-Eog84Wks5VIz92wA%3D%3D)

<i>Screen 2</i>
![Alt text](https://raw.githubusercontent.com/PracticallyGreen/gupta-interview2/master/images/listing.png?token=AAZwlyE4-c-DNwtXOADKrh7uvkPFMVZbks5VIz-iwA%3D%3D)

<i>Screen 3</i>
![Alt text](https://raw.githubusercontent.com/PracticallyGreen/gupta-interview2/master/images/post.png?token=AAZwl-Fnf5GTODXJwpU5F2yeApmIIsXaks5VIz--wA%3D%3D)

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

## Testing

We use rspec for testing :heart:

```
$ bundle exec rspec 
.............

Finished in 1.41 seconds (files took 2.5 seconds to load)
26 examples, 0 failures

```
