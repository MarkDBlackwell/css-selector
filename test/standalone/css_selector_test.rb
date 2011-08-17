require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_selector'

class CssSelectorTest < Test::Unit::TestCase
  include ::CssSelector

  def test_assert_descend
#      assert_select b, 1
#      assert_select a.descend(b), 1
#     ActionDispatch::Assertions::SelectorAssertions.
    CssSelectorTest.expects(:assert_descend).once.returns(nil)
    @controller.expects(:assert_select).times(2)
#    assert_descend @a, @b
  end

#-------------
  private

  def setup
    @a = CssString.new 'a'
    @b = CssString.new 'b'
  end

end
