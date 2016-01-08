ENV['RAILS_ENV'] ||= 'test'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require :default, :development
require 'second_base'
require 'active_support/test_case'
require 'active_support/testing/autorun'
require 'dummy_app/init'
require 'rails/test_help'
Dir['test/test_helpers/*.{rb}'].each { |f| require_relative "../#{f}" }

ActiveSupport.test_order = :random if ActiveSupport.respond_to?(:test_order)

module SecondBase
  class TestCase < ActiveSupport::TestCase

    self.use_transactional_fixtures = false

    include RailsVersionHelpers,
            DummyAppHelpers,
            StreamHelpers

    setup    :delete_dummy_files
    teardown :delete_dummy_files


  end
end
