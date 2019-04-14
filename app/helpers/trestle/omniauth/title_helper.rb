module Trestle
  module Omniauth
    module TitleHelper
      def trestle_omniauth_title
        if Trestle.config.omniauth.logo
          image_tag(Trestle.config.omniauth.logo)
        elsif Trestle.config.site_logo
          image_tag(Trestle.config.site_logo)
        elsif Trestle.config.site_logo_small
          safe_join([
            image_tag(Trestle.config.site_logo_small, alt: "", class: ""),
            content_tag(:span, Trestle.config.site_title),
          ], "\n")
        else
          Trestle.config.site_title
        end
      end
    end
  end
end
