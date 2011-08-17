require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_selector'

# class ConstantsCssSelectorTest < ActiveSupport::TestCase
class ConstantsCssSelectorTest < Test::Unit::TestCase

  def test_constants
    assert_equal '0.0.0', CssSelector::VERSION
  end

end
