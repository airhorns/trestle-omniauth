module Trestle
  module Omniauth
    class Configuration
      extend ActiveSupport::Autoload
      include Configurable

      option :avatar, ->(user) {
               avatar { gravatar(user[:info][:email]) }
             }, evaluate: false

      option :format_user_name, ->(user) {
               if user[:info][:first_name] && user[:info][:last_name]
                 safe_join([user.first_name, content_tag(:strong, user.last_name)], " ")
               else
                 display(user[:info])
               end
             }, evaluate: false

      option :redirect_on_login, -> { Trestle.config.path }, evaluate: false
      option :redirect_on_logout, -> { login_url }, evaluate: false

      option :logo

      option :providers, {}

      def provider(name, *args)
        providers[name] = args
      end
    end
  end
end
