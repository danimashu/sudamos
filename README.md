_This is a **legacy project**, not maintained anymore_

[![Build Status](https://travis-ci.org/danimashu/sudamos.svg?branch=master)](https://travis-ci.org/danimashu/sudamos)
[![Code Climate](https://codeclimate.com/github/danimashu/sudamos/badges/gpa.svg)](https://codeclimate.com/github/danimashu/sudamos)
[![Test Coverage](https://codeclimate.com/github/danimashu/sudamos/badges/coverage.svg)](https://codeclimate.com/github/danimashu/sudamos)

[![Sudamos logo](app/assets/images/sudamos.png)](http://www.sudamos.es/)

Sudamos is a simple Ruby on Rails P2P marketplace focussed in the spanish-sport 2nd hand niche. The app was initially implemented without the intention  thinking in the sudamos-business and not in being a good abstraction of what a P2P marketplace should be. However, for anyone who is starting a marketplace in Ruby on Rails, this repo could potentially be a useful start-point.

Write me a line if you want to use this platform in a production environment.

## Install

- Clone the project
- Rename the  file `config/application.sample.yml` into `config/application.yml`.
- Fill in the `application.yml` file with your own config data (more info below).
- Run `bundle`
- Run `bundle exec rake db:setup`
- Run the tests with `bundle exec rspec spec`
- Open the app locally with your preferred web server and you should see sudamos’ homepage.

### Configs

Sudamos uses some 3rd party services which have configured into the `config/application.yml` file. Basically, all the env vars of Sudamos are stored under that file, managed by the gem https://github.com/laserlemon/figaro.

#### List of 3rd party services

- Image management: Transloadit
- Assets storage: Amazon S3 / CDN Cloudfront
- Authentication: Facebook
- Mailer: Mandrill
- Bug track: Rollbar
- Performance: NewRelic
