require "minitest/autorun"
require "minitest/pride"
require_relative "paragraph"

class ParagraphTest < Minitest::Test

  def test_is_it_a_paragraph
    markdown = "Hello I am a paragraph"
    paragraph = Paragraph.new(markdown)
    assert paragraph.is_a_paragraph?
  end

  def test_it_knows_when_it_is_not_a_paragraph
    markdown = "# Hello I am a header"
    paragraph = Paragraph.new(markdown)
    refute paragraph.is_a_paragraph?

    markdown = "1. Hello I am an ordered list"
    refute paragraph.is_a_paragraph?
  end

  def test_it_recognizes_a_two_line_paragraph
    markdown = "I am a nice litte paragraph/nwith two lines of text."
    paragraph = Paragraph.new(markdown)
    assert paragraph.two_line_paragraph
  end

  def test_it_recognizes_that_a_paragraph_has_ended
    markdown = "I am the last line of a paragraph./n/n"
    paragraph = Paragraph.new(markdown)
    assert paragraph.paragraph_has_ended
  end

  def test_add_html_p_tags
    markdown = "I wish I was a sparkly unicorn."
    paragraph = Paragraph.new(markdown)
    assert_equal paragraph.add_p_tags, "<p>/nI wish I was a sparkly unicorn./n</p>"
  end

end
