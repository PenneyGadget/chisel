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

markdown = "This is a **test**."
strong = Strong.new(markdown)
puts strong.add_strong_tags
