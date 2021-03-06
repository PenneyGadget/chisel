require "minitest/autorun"
require "minitest/pride"
require_relative "emphasis"

class EmphasisTest < Minitest::Test

  def test_is_there_emphasis?
    markdown = "You are *so* nice!"
    words = Emphasis.new(markdown)
    assert words.contains_emphasis
  end

  def test_it_recognizes_there_are_two_asterisks
    markdown = "I have **two** asterisks"
    words = Emphasis.new(markdown)
    assert words.contains_two_asterisks
  end

  def test_change_to_emphasis_tags
    markdown = "You are *so* nice!"
    html = "You are <em>so</em> nice!"
    words = Emphasis.new(markdown)
    assert_equal html, words.add_emphasis
  end

  def test_it_finds_multiple_emphases
    markdown = "You are *so* very *very* nice!"
    html = "You are <em>so</em> very <em>very</em> nice!"
    words = Emphasis.new(markdown)
    assert_equal html, words.add_emphasis
  end

  def test_it_leaves_strong_alone
    markdown = "You are **so** nice!"
    html = "You are **so** nice!"
    words = Emphasis.new(markdown)
    assert_equal html, words.add_emphasis
  end

  def test_it_leaves_unordered_lists_alone
    markdown = "* I am an unordered list"
    html = "* I am an unordered list"
    words = Emphasis.new(markdown)
    assert_equal html, words.add_emphasis
  end

end
