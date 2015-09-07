require "minitest/autorun"
require "minitest/pride"
require_relative "header"

class HeaderTest < Minitest::Test

  def test_recognize_a_header_one
    markdown = "# I am a header one"
    words = Header.new(markdown)
    assert words.header_one
  end

  def test_recognize_a_header_two
    markdown = "## I am a header two"
    words = Header.new(markdown)
    assert words.header_two
  end

  def test_render_header_tags
    markdown = "# I am a header one"
    words = Header.new(markdown)
    html = "<h1>I am a header one</h1>"
    assert_equal html, words.render_header_tags
  end

  def test_render_header_tags_works_with_multiple_hashes
    markdown = "#### I am a header four"
    words = Header.new(markdown)
    html = "<h4>I am a header four</h4>"
    assert_equal html, words.render_header_tags
  end

end
