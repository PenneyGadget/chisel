class Emphasis
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def contains_emphasis
    if markdown.include? "*"
      true
    end
  end

  def contains_two_asterisks
    if markdown.include? "**"
      true
    end
  end

  def render_emphasis_tags
    while markdown.include?("*")
      markdown.sub!("*", "<em>").sub!("*", "</em>")
    end
    markdown
  end

  def add_emphasis
    if markdown.include?("**")
      markdown
    else
      render_emphasis_tags
    end
  end

end
