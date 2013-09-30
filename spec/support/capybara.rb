require 'capybara/rails'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
  #config.include Rails.application.routes.url_helpers
end
