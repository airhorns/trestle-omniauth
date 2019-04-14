class Trestle::Omniauth::SessionsController < Trestle::ApplicationController
  layout "trestle/omniauth"

  skip_before_action :require_authenticated_user

  def new
    @providers = Trestle.config.omniauth.providers.keys
  end

  def create
    login!(request.env["omniauth.auth"])
    redirect_to previous_location || instance_exec(&Trestle.config.omniauth.redirect_on_login)
  end

  def destroy
    logout!
    redirect_to instance_exec(&Trestle.config.omniauth.redirect_on_logout)
  end
end
