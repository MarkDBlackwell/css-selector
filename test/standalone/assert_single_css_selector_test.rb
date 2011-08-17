require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_selector'

class AssertSingleCssSelectorTest < Test::Unit::TestCase
  include ::CssSelector

  def test_simple
    self.expects(:assert_select).with @a, 1, "#{@a} count"
    self.expects(:assert_select).with @a, @v
    self.assert_single @a, @v
  end

  def test_not_css_string_simple
    self.expects(:assert_select).with @a, 1, "#{@a} count"
    self.expects(:assert_select).with @a, @v
    self.assert_single 'a', @v
  end

  def test_array
    expect_bsq
    self.expects(:assert_select).with @s , 1
    self.expects(:assert_select).with @sq, @v
    self.assert_single [@b, @a], @v
  end

  def test_false_array
    expect_bsq
    self.assert_single [@b, @a], @v, false
  end

#-------------
  private

  def setup
    @a = CssString.new 'a'
    @b = CssString.new 'b'
    @v = 'v'
    @s  = "[#{@a}]"
    @sq = "[#{@a}=?]"
  end

  def expect_bsq
    self.expects(:assert_select).with @b, 1
    self.expects(:assert_select).with "#{@b}#{@s}" , 1
    self.expects(:assert_select).with "#{@b}#{@sq}", @v
  end

end
