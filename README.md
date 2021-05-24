# README

Han Chien Leow s3778722 %50
Evan Blake Mason s3688949 %50

80+ Level attempted

Working days:
Han Chien Leow: Around 21 days
Evan Blake Mason: Around 21 days

git location
https://github.com/s3778722/RAD2021_s3688949_s3778722/

heroku app deployment url
https://my-fashion-app-rad-a1.herokuapp.com/

CONFIGURATION INFORMATION

  Make sure you have these versions of ruby & rails installed.

  #Ruby version 2.7.2
  #Rails 5.2.6 

  run bundle.

  *For non heroku/postgres
   comment out pg gem in gemfile

  ONCE RUNNING

  rails db:migrate:reset to get tables running
  rails db:seed to fill data

*Deployment instructions
For initalizing database:
heroku pg:reset DATABASE
heroku run rake db:migrate
heroku run rake db:seed

HEROKU LOG:
-----> Building on the Heroku-20 stack
-----> Using buildpack: heroku/ruby
-----> Ruby app detected
-----> Installing bundler 2.2.16
-----> Removing BUNDLED WITH version in the Gemfile.lock
-----> Compiling Ruby/Rails
-----> Using Ruby version: ruby-2.7.2
-----> Installing dependencies using bundler 2.2.16
       Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 bundle install -j4
       Using rake 13.0.3
       Using concurrent-ruby 1.1.8
       Using i18n 1.8.10
       Using minitest 5.14.4
       Using thread_safe 0.3.6
       Using tzinfo 1.2.9
       Using activesupport 5.2.6
       Using builder 3.2.4
       Using erubi 1.10.0
       Using mini_portile2 2.5.1
       Using racc 1.5.2
       Using nokogiri 1.11.5 (x86_64-linux)
       Using rails-dom-testing 2.0.3
       Using crass 1.0.6
       Using loofah 2.9.1
       Using rails-html-sanitizer 1.3.0
       Using actionview 5.2.6
       Using rack 2.2.3
       Using rack-test 1.1.0
       Using actionpack 5.2.6
       Using nio4r 2.5.7
       Using websocket-extensions 0.1.5
       Using websocket-driver 0.7.3
       Using actioncable 5.2.6
       Using globalid 0.4.2
       Using activejob 5.2.6
       Using mini_mime 1.1.0
       Using mail 2.7.1
       Using actionmailer 5.2.6
       Using activemodel 5.2.6
       Using arel 9.0.0
       Using activerecord 5.2.6
       Using marcel 1.0.1
       Using activestorage 5.2.6
       Using bcrypt 3.1.16
       Using msgpack 1.4.2
       Using bootsnap 1.7.5
       Using bundler 2.2.16
       Using coffee-script-source 1.12.2
       Using execjs 2.8.1
       Using coffee-script 2.4.1
       Using method_source 1.0.0
       Using thor 1.1.0
       Using railties 5.2.6
       Using coffee-rails 4.2.2
       Using ffi 1.15.1
       Using hashie 4.1.0
       Using jbuilder 2.11.2
       Using jquery-rails 4.4.0
       Using oauth 0.5.6
       Using rack-protection 2.1.0
       Using omniauth 2.0.4
       Using omniauth-oauth 1.2.0
       Using omniauth-rails_csrf_protection 1.0.0
       Using omniauth-twitter 1.4.0
       Using pg 1.2.3
       Using puma 3.12.6
       Using sprockets 3.7.2
       Using sprockets-rails 3.2.2
       Using rails 5.2.6
       Using rb-fsevent 0.11.0
       Using rb-inotify 0.10.1
       Using sass-listen 4.0.0
       Using sass 3.7.4
       Using tilt 2.0.10
       Using sass-rails 5.1.0
       Using turbolinks-source 5.2.0
       Using turbolinks 5.2.1
       Using uglifier 4.2.0
       Bundle complete! 23 Gemfile dependencies, 69 gems now installed.
       Gems in the groups 'development' and 'test' were not installed.
       Bundled gems are installed into `./vendor/bundle`
       Bundle completed (0.50s)
       Cleaning up the bundler cache.
-----> Installing node-v12.16.2-linux-x64
-----> Detecting rake tasks
-----> Preparing app for Rails asset pipeline
       Running: rake assets:precompile
       Yarn executable was not detected in the system.
       Download Yarn at https://yarnpkg.com/en/docs/install
       I, [2021-05-24T03:04:11.730987 #302]  INFO -- : Writing /tmp/build_00433523/public/assets/application-79810f44e029be7fa8af1c30c6517a7fca3d4df777838756cb3b22b67e182c74.css
       I, [2021-05-24T03:04:11.731775 #302]  INFO -- : Writing /tmp/build_00433523/public/assets/application-79810f44e029be7fa8af1c30c6517a7fca3d4df777838756cb3b22b67e182c74.css.gz
       Asset precompilation completed (1.73s)
       Cleaning assets
       Running: rake assets:clean
-----> Detecting rails configuration
###### WARNING:
       There is a more recent Ruby version available for you to use:
       
       2.7.3
       
       The latest version will include security and bug fixes. We always recommend
       running the latest version of your minor release.
       
       Please upgrade your Ruby version.
       
       For all available Ruby versions see:
         https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
###### WARNING:
       No Procfile detected, using the default web server.
       We recommend explicitly declaring how to boot your server process via a Procfile.
       https://devcenter.heroku.com/articles/ruby-default-web-server
-----> Discovering process types
       Procfile declares types     -> (none)
       Default types for buildpack -> console, rake, web
-----> Compressing...
       Done: 56.6M
-----> Launching...
       Released v13
       https://my-fashion-app-rad-a1.herokuapp.com/ deployed to Heroku

