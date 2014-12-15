ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/mutilator.rb')

require 'capybara'
require 'capybara/cucumber'
require 'cucumber/api_steps'
<<<<<<< HEAD
require 'active_support/core_ext/object/blank'
=======
>>>>>>> api-steps
require 'rspec'
require 'coveralls'
Coveralls.wear_merged!

Capybara.app = Mutilator

class MutilatorWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

  def app
    Mutilator
  end
end

World do
  MutilatorWorld.new
end
