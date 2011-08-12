require File.dirname(__FILE__) + '/test_helper'

# class CssStringTest < ActiveSupport::TestCase

class CssStringTest < Test::Unit::TestCase

  include CssStringNamespace

  def test_css_string_defined_if_included
    assert defined? CssString
  end

end
