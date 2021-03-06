require 'active_support/all'
require 'action_view/helpers'
require 'gulp_helpers/version'
require 'gulp_helpers/helpers'
require 'gulp_helpers/config'

require 'gulp_helpers/railtie' if defined?(Rails)
require 'gulp_helpers/engine' if defined?(Rails)

module GulpHelpers
  class << self
    @_config = nil

    def config(options = {})
      @_config || @_config = GulpHelpers::Config.new(options)
    end

    def configure
      config.instance_eval do
        yield self
      end
    end

    def method_missing(meth, *args)
      if config.respond_to?(meth)
        config.send(meth, *args)
      else
        super
      end
    end

    def respond_to?(meth)
      config.respond_to? meth
    end
  end
end
