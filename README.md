# Simple Ruby on Rails User Authentication

### Based on Ruby on Rails Tutorial, by Michael Hartl.

By: Pedro Dousseau<pedro@dousseau.com> [website](http://dousseau.me) 

Basic user authentication for web application. Made to build user driven web-applications controlled by admin users. Customizable, easy to make changes and add features.

**It does not use cookies, send emails, or have 'forgot password' and 'remember me' options.*


#### Create the following using the files provided
__Controllers:__

1. User: interact with user model.
2. Session: handle authentication and session.
3. Application: load session helper on every controller.

__Models:__

1. User: set up db using create_user migration.

__Helpers:__

1. Session: functions to be used on controllers add user support to the controllers.

__Used Gems:__
```
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1' (OPTIONAL)

```