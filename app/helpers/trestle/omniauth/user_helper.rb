module Trestle::Omniauth::UserHelper
  def format_user_name(user)
    instance_exec(user, &Trestle.config.omniauth.format_user_name)
  end

  def avatar_for(user)
    instance_exec(user, &Trestle.config.omniauth.avatar) if Trestle.config.omniauth.avatar
  end
end
