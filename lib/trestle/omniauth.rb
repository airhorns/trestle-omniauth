require "trestle"

module Trestle
  module Omniauth
    extend ActiveSupport::Autoload
    autoload :Configuration
    autoload :ControllerMethods
  end

  Configuration.option :omniauth, Omniauth::Configuration.new
end

require "trestle/omniauth/engine"
