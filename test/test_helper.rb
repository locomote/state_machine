if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start { add_filter '/test/' }
end

require 'test/unit'
# Integration tests (e.g. active_record) inherit from ActiveSupport::TestCase,
# which is a Minitest::Test, so minitest's autorun is needed to execute them.
# Plain tests use the test-unit gem's Test::Unit::TestCase, which has its own
# autorun; loading minitest/autorun there would suppress it, so only load it
# when running under an appraisal integration gemfile.
if %w(active_model active_record data_mapper mongoid mongo_mapper sequel).any? { |name| Bundler.default_gemfile.to_s.include?(name) }
  require 'minitest/autorun'
end
require 'state_machine'
