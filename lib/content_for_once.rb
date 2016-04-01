require "content_for_once/helpers"

ActiveSupport.on_load :action_view do
  include ContentForOnce::Helpers
end
