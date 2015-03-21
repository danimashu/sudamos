[![Build Status](https://travis-ci.org/danimashu/sudamos.svg?branch=master)](https://travis-ci.org/danimashu/sudamos)
[![Code Climate](https://codeclimate.com/github/danimashu/sudamos/badges/gpa.svg)](https://codeclimate.com/github/danimashu/sudamos)
[![Test Coverage](https://codeclimate.com/github/danimashu/sudamos/badges/coverage.svg)](https://codeclimate.com/github/danimashu/sudamos)

[![Sudamos logo](app/assets/images/sudamos.png)](http://www.sudamos.es/)

Sudamos is a P2P simple marketplace programmed by [Daniel Madrid](http://danimadrid.com/) as his side-project. You can see the production app working here: http://sudamos.es/ .

## Setup your own marketplace

The project is not completely ready for forking and start using it by your own in a very automated way, since at the end, this was, before became open-source, a standard private repo of a production app. However, following these quick guidelines you should be quite near of having something working.

Write me a line if you want to use this platform in a production environment.

### Configs

All the 3rd party api keys of sudamos are stored under the same file called `application.sample.yml`, which you should rename to `application.yml`. The gem https://github.com/laserlemon/figaro is used for the management of the keys.

3rd party services:

- Image management: Transloadit
- Assets storage: Amazon S3 / CDN Cloudfront
- Authentication: Facebook
- Mailer: Mandrill
- Bug track: Rollbar
- Performance: NewRelic

### Steps

- Fork the project
- Rename the  file `application.sample.yml` to `application.yml`. Fill in the needed configs there.
- Run `bundle`
- Run `bundle exec rake db:setup`
- Run the tests with `bundle exec rspec spec`
- Open the app locally with your preferred web server and you should see the app working with some seed data.
