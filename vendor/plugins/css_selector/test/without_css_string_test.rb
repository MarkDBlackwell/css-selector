require 'test_helper'

class WithoutCssStringTest < ActiveSupport::TestCase

  test 'before_app_includes_CssStringNamespace' do
    assert  defined?(CssStringNamespace), 'missing CssStringNamespace'
# CssString should not be present:
    assert !defined?(CssString), 'CssString unexpectedly present'
  end

end
