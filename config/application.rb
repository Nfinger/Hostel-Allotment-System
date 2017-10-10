require_relative 'boot'

require 'rails/all'
require 'csv'
require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HostelRoomAlotment
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Kolkata'
 config.active_record.default_timezone = :local
  end
end
