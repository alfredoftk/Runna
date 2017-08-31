# RunaHR API

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

## System dependencies

## Configuration

## Database creation

## Database initialization

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

* Install RVM (https://rvm.io/rvm/install)

Install GPG keys

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

Install RVM stable with ruby

```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

To start using RVM you need to run source 

```
/home/<user>/.rvm/scripts/rvm
```

* Install Ruby version 2.4.1 by RVM

Run from server:
```
rvm install ruby-2.4.1
```

* Mina setup

Run from local:
```
mina setup
```

* Gemset and bundler

From server, go to the directory app and run:
```
rvm gemset use 2.4.1@<gemset-name> 
gem install bundler
```

* Deploy using Mina

Run from local:
```
mina deploy
```


## ...
