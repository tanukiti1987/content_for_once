module ContentForOnce
  module Helpers
    def content_for_once(name, &block)
      @contents ||= Hash.new {|h, k| h[k] = '' }
      name = name.to_sym

      @contents[name].concat(capture(&block))
      @contents[name] = @contents[name].scan(/<.*?>/).uniq.join

      @contents.each do |name, content|
        # ref: https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/capture_helper.rb#L149
        @view_flow.set(name, content)
      end
    end
  end
end
