require File.dirname(__FILE__) + '/../standalone_test_helper'

## class WithoutCssStringNamespaceTest < ActiveSupport::TestCase
class WithoutCssStringNamespaceTest < Test::Unit::TestCase

  def test_before_app_includes_CssStringNamespace
    assert  defined?(CssStringNamespace), 'missing CssStringNamespace'
# CssString should not be present:
    assert !defined?(CssString), 'CssString unexpectedly present'
  end

end
