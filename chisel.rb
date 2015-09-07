require_relative 'parser'

class Chisel
  attr_reader :markdown, :html

  def initialize(markdown, html)
    @markdown = markdown
    @html = html
  end

  def markdown_to_html
    @markdown = File.open(ARGV[0]).read
    @html = File.open(ARGV[1], "w")

    text = Parser.new(@markdown)
    converted_text = text.parse
    @html.write(converted_text)

    # lines_of_markdown = markdown.each_line.count
    # lines_of_html = html.each_line.count
    # puts "Converted #{markdown} (#{lines_of_markdown} lines) to #{html} (#{lines_of_html} lines)"
  end

end

if $PROGRAM_NAME == __FILE__
  run_chisel = Chisel.new(ARGV[0], ARGV[1])
  run_chisel.markdown_to_html
end
