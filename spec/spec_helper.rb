require 'simplecov'
SimpleCov.start

require 'board'
require 'player'
require 'controller/computer'
require 'controller/human'
require 'prompt/main_menu'
require 'prompt/difficulty'
require 'configuration'
require 'board_simulator'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
