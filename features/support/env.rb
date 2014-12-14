ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/mutilator.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

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
