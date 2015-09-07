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
    elsif (markdown.count "*") > 1
      render_emphasis_tags
    else
      markdown
    end
  end

end

markdown = "This is a *test*."
emphasis = Emphasis.new(markdown)
puts emphasis.add_emphasis
