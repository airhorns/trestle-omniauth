require "omniauth"

module Trestle
  module Omniauth
    class Engine < ::Rails::Engine
      isolate_namespace Trestle::Omniauth

      config.assets.precompile << "trestle/omniauth.css" << "trestle/omniauth/userbox.css"

      config.before_initialize do
        Trestle::Engine.paths["app/helpers"].concat(paths["app/helpers"].existent)
      end

      initializer "trestle.omniauth.extend_controller" do
        Trestle::ApplicationController.send(:include, Trestle::Omniauth::ControllerMethods)
      end

      initializer "trestle.omniauth.configure" do
        Trestle::Engine.middleware.use ::OmniAuth::Builder do
          Trestle.config.omniauth.providers.each do |name, args|
            options = args.extract_options!
            options[:path_prefix] = Trestle.config.path
            self.provider name, *args
          end
        end
      end
    end
  end
end
