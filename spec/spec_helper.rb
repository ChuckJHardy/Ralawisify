require 'simplecov'

ENV["RAILS_ENV"] ||= 'test'

require 'rspec/autorun'
require_relative '../ralawisify'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.filter_run :focus => true
  config.color_enabled = true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
