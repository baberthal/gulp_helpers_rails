require 'gulp_helpers'
require 'rails'

module GulpHelpers
  if Rails.env.production?
    class << self
      rev_manifest_path = 'public/assets/rev-manifest.json'

      if File.exist?(rev_manifest_path)
        REV_MANIFEST = JSON.parse(File.read(rev_manifest_path))
      end
    end
  end

  class Railtie < Rails::Railtie
    railtie_name :gulp_helpers

    initializer :gulp_asset_helpers do
      helpers = 'include Helpers'
      ActionView::Base.module_eval(helpers)
      Rails.application.assets.context_class.class_eval(helpers)
    end
  end
end
