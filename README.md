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

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
