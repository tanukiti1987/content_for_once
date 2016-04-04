module ContentForOnce
  module Helpers
    def content_for_once(name, &block)
      @contents ||= Hash.new {|h, k| h[k] = '' }
      name = name.to_sym

      @contents[name].concat(capture(&block)) if capture(&block).present?
      @contents[name] = Nokogiri::HTML.fragment(@contents[name]).children.
        map(&:to_s).select(&:present?).map {|e| e.gsub(/>\n/, '>') }.uniq.join("\n")

      @contents.each do |name, content|
        # ref: https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/capture_helper.rb#L149
        _content = @view_flow.get(name).presence || ''
        _content.concat(content.html_safe)
        _content = Nokogiri::HTML.fragment(_content.encode("UTF-8")).children.
          map(&:to_s).select(&:present?).map {|e| e.gsub(/>\n/, '>') }.uniq.join("\n")
        @view_flow.set(name, _content)
      end
    end
  end
end
