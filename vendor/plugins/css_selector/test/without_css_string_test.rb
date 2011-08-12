require 'test_helper'

## class WithoutCssStringTest < ActiveSupport::TestCase
class WithoutCssStringTest < Test::Unit::TestCase

##  test "before_app_includes_CssStringNamespace"
  def test_before_app_includes_CssStringNamespace
    assert  defined?(CssStringNamespace), 'missing CssStringNamespace'
# CssString should not be present:
    assert !defined?(CssString), 'CssString unexpectedly present'
  end

end
