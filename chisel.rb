class Chisel
  attr_reader :markdown, :html

  def initialize(markdown, html)
    @markdown = markdown
    @html = html
  end

  def markdown_to_html
    markdown = File.read(markdown)
    html = Parser.new(markdown).markdown_to_html
    File.write(html, html)

    lines_of_markdown = markdown.lines.count
    lines_of_html = html.lines.count
    puts "Converted #{markdown} (#{lines_of_markdown} lines) to #{html} (#{lines_of_html} lines)"
  end

end

if $PROGRAM_NAME == __FILE__
  run_chisel = Chisel.new(ARGV[0], ARGV[1])
end
