# Trestle::Omniauth

Adds stateless authentication for [Trestle](https://trestle.io/) via [`omniauth`](https://github.com/omniauth/omniauth) providers. Similar to [`trestle-auth`](https://github.com/TrestleAdmin/trestle-auth), but doesn't require extra models, and works good if you're already using an OAuth provider for authentication elsehwere.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'trestle-omniauth'
```

Add whichever OmniAuth strategies you will use for authentication to your Gemfile as well:

```ruby
gem 'omniauth-google-oauth2'  # for example
```

And then run bundler to install your new gems:
```bash
$ bundle
```

__Note__: You don't need to mount this gem like you might with `Trestle`. It just plugs in to the existing way that Trestle is mounted in your app.

## Usage

`trestle-omniauth` uses Omniauth providers unadulterated. To add providers, use the `omniauth.provider` method exposed on the trestle config the same way you'd use the `OmniAuth::Builder#provider` method.

In your `config/initializers/trestle.rb`, add providers like so:

```ruby
# config/initializers/trestle.rb
Trestle.configure do |config|
# ...
# ...
  config.omniauth.provider :developer unless Rails.env.production?
  config.omniauth.provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
```

You can also use Trestle's route helpers if you need to add more login/logout links:

```ruby
# in a view somewhere
<%= link_to "Logout", trestle.logout_url %>
```

### Notes

 - `trestle-omniauth` doesn't do anything in particular to filter which users can authenticate with your application. If the authentication provider you configured authorizes a user, then they are able to use the whole of the admin. In the case of something like Google OAuth2, there's an option to create an Internal Only credential, which will disallow anyone outside the Google organization from logging in. See https://support.google.com/cloud/answer/6158849?hl=en for more details.
 - Authentication can be skipped for certain controllers using Trestle's `controller` block to skip the before filter like so:

```ruby
Trestle.resource(:resource) do
  # ...
  controller do
    skip_before_action :require_authenticated_user, only: [:dump]

    def dump
      render json: Resource.all
    end
  end
end
```
 - Omniauth listens using the same path prefix that Trestle is set up with. So, if `Trestle.config.path = "/admin"`, the auth URLs will be `/admin/auth/:provider` etc. This is implemented using Omniauth's `:path_prefix` provider option which is passed automatically.

## License

The gem is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0). All credit goes to [trestle-auth](https://github.com/TrestleAdmin/trestle-auth) of which this gem is a close derivative.