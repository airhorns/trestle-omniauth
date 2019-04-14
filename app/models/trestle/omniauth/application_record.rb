module Trestle
  module Omniauth
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
