require "trestle/omniauth/engine"

module Trestle
  module Omniauth
    extend ActiveSupport::Autoload

    autoload :Configuration
    autoload :LateOmniauthBuilder
    autoload :ControllerMethods
  end

  Configuration.option :omniauth, Omniauth::Configuration.new
end
