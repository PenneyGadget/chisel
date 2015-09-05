require "minitest/autorun"
require "minitest/pride"
require_relative "strong"

class StrongTest < Minitest::Test

  def test_change_to_strong_tags
    markdown = "You are the **bestest** ever!"
    html = "You are the <strong>bestest</strong> ever!"
    words = Strong.new(markdown)
    assert_equal html, words.add_strong_tags
  end

  def test_it_finds_multiple_strong_words
    markdown = "You are **so** very **very** nice!"
    html = "You are <strong>so</strong> very <strong>very</strong> nice!"
    words = Strong.new(markdown)
    assert_equal html, words.add_strong_tags
  end

  def test_it_leaves_emphasis_alone
    markdown = "You are *so* nice!"
    html = "You are *so* nice!"
    words = Strong.new(markdown)
    assert_equal html, words.add_strong_tags
  end

end
