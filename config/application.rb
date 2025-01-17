# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require "active_job/railtie"
require 'active_record/railtie'
# require "active_storage/engine"
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DoorkeeperProvider
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Brazilian datetime and lang
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :utc
    config.i18n.default_locale = :'pt-BR'

    config.to_prepare do
      # Only Applications list
      Doorkeeper::ApplicationsController.layout 'application'
      Doorkeeper::AuthorizationsController.layout 'application'
    end
  end
end
