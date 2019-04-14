Rails.application.routes.draw do
  mount Trestle::Omniauth::Engine => "/trestle-omniauth"
end
