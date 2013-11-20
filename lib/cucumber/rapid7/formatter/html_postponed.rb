require 'cucumber/formatter/html'

class HtmlPostponed < Cucumber::Formatter::Html
  def after_features(features)
    @builder << '</div>' # Close the previous <div>
    @skip_tags = ENV['CUCUMBER_SKIP_TAGS'].split(',')
    @file_colon_lines = []

    @builder << '<div class="cucumber">'
      @builder << '<div class="feature">'
        @builder << '<h2>'
          @builder << 'Postponed tests (using $CUCUMBER_SKIP_TAGS)'
        @builder << '</h2>'
        @builder << '<span class="tag">'
          @skip_tags.each { |tag| @builder << tag }
        @builder << '</span>'
        @builder << '<ol>'
          features.each do |feature|
            if (@skip_tags & feature.source_tag_names).any?
              unless @file_colon_lines.include? feature.file_colon_line
                @builder << '<li>'
                @builder << feature.file_colon_line
                @builder << '</li>'
              end
            end
          end
        @builder << '</ol>'
      @builder << '</div>'
    @builder << '</div>'

    @builder << '<div>'
    super # Give the HTML formatter control
  end
end
