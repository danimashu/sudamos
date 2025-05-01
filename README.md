#### ‼️ _This is a legacy project that is no longer maintained._

---

[![Build Status](https://travis-ci.org/danimashu/sudamos.svg?branch=master)](https://travis-ci.org/danimashu/sudamos)
[![Code Climate](https://codeclimate.com/github/danimashu/sudamos/badges/gpa.svg)](https://codeclimate.com/github/danimashu/sudamos)
[![Test Coverage](https://codeclimate.com/github/danimashu/sudamos/badges/coverage.svg)](https://codeclimate.com/github/danimashu/sudamos)

[![Sudamos logo](app/assets/images/sudamos.png)](http://www.sudamos.es/)

Sudamos is a Ruby on Rails P2P marketplace focused on the Spanish second-hand sports niche. The app was initially built with a specific business focus rather than as a generic marketplace solution. However, it can be a useful starting point for anyone building a marketplace in Ruby on Rails.

Write me a line if you want to use this platform in a production environment.

## Install

- Clone the project
- Rename `config/application.sample.yml` to `config/application.yml`
- Fill in the `application.yml` file with your own config data (more info below)
- Run `bundle`
- Run `bundle exec rake db:setup`
- Run the tests with `bundle exec rspec spec`
- Open the app locally with your preferred web server to see Sudamos' homepage

### Configs

Sudamos uses several third-party services configured in the `config/application.yml` file. All environment variables are stored in this file and managed by the [Figaro gem](https://github.com/laserlemon/figaro).

#### List of 3rd party services

- Image management: Transloadit
- Asset storage: Amazon S3 with CloudFront CDN
- Authentication: Facebook
- Mailer: Mandrill
- Bug tracking: Rollbar
- Performance monitoring: NewRelic
