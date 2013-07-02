require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module FuzzyComputingMachine
  class Application < Rails::Application
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
