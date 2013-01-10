# Rails 3.2 Application Template

Contains a default configuration for basic Rails 3.2 application.

## Usage

Clone repository and install all gems:

```
git clone REPOSITORY_GIT_URL
cd postgres-rails-template
bundle install
```

Rename application:

```
NEW_NAME=CoolApplication bundle exec rake rails:rename
```

Reset git repository:

```
rake rails:reset_git
git init
git add .
git commit -m "Initial Commit"
```

Update:

```
bundle update
```

## Gems

This template includes default gems:

- `rails`               - Rails core
- `jquery-rails`        - jQuery library
- `postgres`            - Postgresql database adapter
- `squeel`              - DSL extensions for AR
- `paperclip`           - File attachments
- `simple_form`         - Simple form builder
- `dynamic_form`        - Form helpers
- `default_value_for`   - AR default attribute values
- `authlogic`           - Authentication framework
- `inherited_resources` - Automatic resource controllers 
- `sendgrid-rails`      - Sendgrid mailer adapter
- `will_paginate`       - Pagination extension for AR
- `bourbon`             - Sass Mixins
- 'neat'                - Fluid Grid Framework
- `flutie`              - Style Defaults
- `high_voltage`        - Simple static pages
- `rspec`               - Test Framework
- `spork`               - for faster tests
- `thin`                - Web Server

## Database

Edit `config/database.yml`

```
# /config/database.yml

  defaults: &defaults
  adapter: postgresql
  host: localhost
  encoding: utf8
  pool: 5
  username: root
  password:
  timeout: 5000

development:
  <<: *defaults
  database: <app_name_development>
  
test:
  <<: *defaults
  database: <app_name_test>
```

create database:

```
createbd -Oroot -Eutf8 app_name_development
createbd -Oroot -Eutf8 app_name_test
```

Thanks to [Dan Sosedoff](https://github.com/sosedoff)

#### MIT License

Copyright (c) 2012-*

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
