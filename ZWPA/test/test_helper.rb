require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require 'rails/test_help'
require 'contexts'

class ActiveSupport::TestCase
  	ActiveRecord::Migration.check_pending!

  	# include the Contexts module for all tests
  	include Contexts

  	# Helper method to increase readability
  	def deny(condition, msg="")
    	assert !condition, msg
  	end

	# Spruce up minitest results...
  	Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
end
