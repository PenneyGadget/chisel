require_relative 'emphasis'
require_relative 'header'
require_relative 'paragraph'
require_relative 'strong'

class Parser

  def initialize(markdown)
    @markdown = markdown
  end

  def parse
    paragraphs = @markdown.split("\n\n")
    paragraphs.each do |paragraph|

    if paragraph[0] != "#" && paragraph[0] != (1..9).to_s
      text = Paragraph.new(paragraph)
      text.add_p_tags
    end

    if paragraph.include?("#")
      text = Header.new(paragraph)
      text.render_header_tags
    end

    if paragraph.include?("**")
      text = Strong.new(paragraph)
      text.add_strong_tags
    end

    if paragraph.include?("*")
      text = Emphasis.new(paragraph)
      text.add_emphasis
    end
  end
  paragraphs.join
  end

end


# needs to be able to split paragraph on /n/n (so you'll
# have an array...)
