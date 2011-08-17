require File.dirname(__FILE__) + '/../standalone_test_helper'

class WithoutCssStringConstantTest < Test::Unit::TestCase

  def test_before_app_requires_css_string_constant
# CssStringConstant should not be present:
    assert !defined?(CssStringConstant), 'CssStringConstant module unexpectedly present'
  end

end
