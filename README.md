# Rails 3.2 Application Template

Contains a default configuration for basic Rails 3.2 application.

## Usage

Clone repository and install all gems:

```
git clone REPOSITORY_GIT_URL
cd rails_template
bundle install
```

Rename application:

```
NEW_NAME=CoolApplication rake rails:rename
```

Reset git repository:

```
rake rails:reset_git
```

## Gems

This template includes default gems:

- `rails`               - Rails core
- `mysql2`              - Mysql database adapter
- `squeel`              - DSL extensions for AR
- `paperclip`           - File attachments
- `simple_form`         - Simple form builder
- `default_value_for`   - AR default attribute values
- `authlogic`           - Authentication framework
- `inherited_resources` - Automatic resource controllers 
- `dynamic_form`        - Form helpers
- `jquery-rails`        - jQuery library
- `sendgrid-rails`      - Sendgrid mailer adapter
- `will_paginate`       - Pagination extension for AR