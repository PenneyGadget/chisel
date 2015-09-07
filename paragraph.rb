class Paragraph
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def is_a_paragraph?
    if @markdown[0] != "#" && @markdown[0] != (1..9).to_s
      true
    end
  end

  def two_line_paragraph
    "Hello I am a paragraph/nthat contains two lines of text."
  end

  def paragraph_has_ended
    "I am the last line of a paragraph./n/n"
  end

  def add_p_tags
      if @markdown[0] != "#" && @markdown[0] != "*" && @markdown[0] != (1..9).to_s #can I require my other files and instead write this as "if markdown != header, emphasis, etc. then it's a paragraph?"
        "<p>/n#{markdown}/n</p>"
      else
        @markdown
      end
  end

end

markdown = "This is a test."
paragraph = Paragraph.new(markdown)
puts paragraph.add_p_tags
