require File.dirname(__FILE__) + '/test_helper'

class UndefinedCssStringTest < Test::Unit::TestCase

  def test_css_string_not_defined_if_not_included
    assert defined? CssStringNamespace
    flunk if defined? CssString
  end

end

