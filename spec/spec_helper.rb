require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
#require 'rails/application'
require "rails/mongoid"
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
#Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
#Spork.trap_class_method(Rails::Mongoid, :load_models)


include Warden::Test::Helpers
Warden.test_mode!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.include Mongoid::Matchers

  config.before(:each) do
    # Drop all collections and clear the identity map before each spec.
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end

  config.include ControllerMacros, :type => :controller
  #config.include Devise::TestHelpers, :type => :controller

  #config.treat_symbols_as_metadata_keys_with_true_values = true
  #config.filter_run :focus => true
  #config.run_all_when_everything_filtered = true

  config.infer_base_class_for_anonymous_controllers = false
end
