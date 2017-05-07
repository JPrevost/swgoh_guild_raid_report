require 'simplecov'
require 'coveralls'
SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start('rails')
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alpha order.
    fixtures :all

    VCR.configure do |config|
      config.cassette_library_dir = 'test/vcr_cassettes'
      config.hook_into :webmock
    end
  end
end
