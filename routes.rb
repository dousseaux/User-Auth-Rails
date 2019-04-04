# User Controller
get    '/user',                    to: 'users#show',                    as: 'user'
get    '/users',                   to: 'users#index',                   as: 'users'
get    '/users/new',               to: 'users#new',                     as: 'new_user'
post   '/users/new',               to: 'users#create'
get    '/profile',                 to: 'users#edit',                    as: 'user_profile'
patch  '/profile',                 to: 'users#update'
delete '/profile',                 to: 'users#destroy'

# Session Controller
get  '/sign-in',                   to: 'session#new',                    as: 'signin'
post '/sign-in',                   to: 'session#create'
get  '/sign-out',                  to: 'session#destroy',                as: 'signout'
