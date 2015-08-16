require 'gulp_helpers'
require 'rails'

module GulpHelpers
  class Railtie < Rails::Railtie
    railtie_name :gulp_helpers

    initializer :gulp_asset_helpers do
      helpers = 'include Helpers'
      ActionView::Base.module_eval(helpers)
      Rails.application.assets.context_class.class_eval(helpers)
    end
  end
end
