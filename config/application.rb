require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Postgresrailsapptemplate
  VERSION = '0.1.0' 

  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = "utf-8"
    config.filter_parameters += [:password, :api_token]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'

    config.generators do |g|
      g.stylesheets = false
      g.javascripts = false
      g.test_framework :rspec, :fixture => true
      g.fixture_replacement :fabrication
    end
  end

  def self.config
    @@config ||= load_config
  end

  def self.load_config
    data = YAML.load_file(Rails.root.join('config/application.yml'))
    data[Rails.env.to_s]
  end
end
