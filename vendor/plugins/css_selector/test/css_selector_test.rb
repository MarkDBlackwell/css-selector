require 'test_helper'
# p require 'mocha' # Already in Gemfile.

class CssSelectorTest < ActiveSupport::TestCase
  include CssSelector
#  include CssStringNamespace

  test 'assert_descend' do
#      assert_select b, 1
#      assert_select a.descend(b), 1
#     ActionDispatch::Assertions::SelectorAssertions.
CssSelector.
expects(:assert_select).
        times(2)
    assert_descend @a, @b
  end

#-------------
  private

  def setup
    @a = CssString.new 'a'
    @b = CssString.new 'b'
  end

end
