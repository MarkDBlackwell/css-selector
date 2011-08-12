require File.dirname(__FILE__) + '/test_helper'

class BeforeIncludingCssStringTest < Test::Unit::TestCase

  def test_before_including
    assert  defined?(CssStringNamespace), 'missing CssStringNamespace'
# CssString should not be present:
    assert !defined?(CssString), 'CssString unexpectedly present'
  end

end

