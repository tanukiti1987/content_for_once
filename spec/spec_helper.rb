$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'action_view'
require 'content_for_once'
require "content_for_once/version"

RSpec.configure do |config|
  config.include ContentForOnce::Helpers
  config.include ActionView::Helpers
end
