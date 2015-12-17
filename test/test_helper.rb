require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into(:webmock)
  end

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Twittertoo::Application
    stub_omniauth
  end

  def stub_omniauth

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Nicole",
          screen_name: "ColeMersich",
        }
      },
      credentials: {
        access_token: ENV["access_token"],
        access_token_secret: ENV["access_token_secret"]
      }
      })

    end

  end
