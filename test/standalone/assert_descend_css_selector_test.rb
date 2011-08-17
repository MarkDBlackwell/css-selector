require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_selector'

class AssertDescendCssSelectorTest < Test::Unit::TestCase
  include ::CssSelector

  def test_it
    self.expects(:assert_select).with @a, 1
    self.expects(:assert_select).with "#{@b} #{@a}", 1
    self.assert_descend @b, @a
  end

#-------------
  private

  def setup
    @a = CssString.new 'a'
    @b = CssString.new 'b'
  end

end
