require File.dirname(__FILE__) + '/test_helper'

class UndefinedCssSelectorTest < Test::Unit::TestCase

  def test_css_selector_not_defined_if_not_included
    assert defined? CssSelectorNamespace
    flunk if defined? CssSelector
  end

end

