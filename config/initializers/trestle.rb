Trestle.configure do |config|
  config.hook("stylesheets") do
    stylesheet_link_tag("trestle/omniauth/userbox")
  end

  config.hook("view.header") do
    render "trestle/omniauth/userbox"
  end
end
