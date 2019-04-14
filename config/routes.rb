# Trestle::Omniauth::Engine doesn't actually get mounted, and instead the routes are appended to the normal Trestle engine's routes.
Trestle::Engine.routes.draw do
  controller "trestle/omniauth/sessions" do
    get "login" => :new, as: :login
    get "logout" => :destroy, as: :logout
    post "/auth/:provider/callback" => :create
  end
end
