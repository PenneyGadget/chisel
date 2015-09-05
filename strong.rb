class Strong

  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def add_strong_tags
    while markdown.include?("**")
      markdown.sub!("**", "<strong>").sub!("**", "</strong>")
    end
    markdown
  end

end
