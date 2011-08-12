require File.dirname(__FILE__) + '/test_helper'

class WithoutCssStringTest < Test::Unit::TestCase

  def test_before_app_includes_CssStringNamespace
    assert  defined?(CssStringNamespace), 'missing CssStringNamespace'
# CssString should not be present:
    assert !defined?(CssString), 'CssString unexpectedly present'
  end

end

