class Header

  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def header_one
    if markdown.include? "# "
      true
    end
  end

  def header_two
    if markdown.include? "## "
      true
    end
  end

  def render_header_tags
    num = markdown.count('#')
    markdown.delete!('#').strip!
    "<h#{num}>#{markdown}</h#{num}>"
  end

end

# markdown = "## This is a test."
# header = Header.new(markdown)
# puts header.render_header_tags
