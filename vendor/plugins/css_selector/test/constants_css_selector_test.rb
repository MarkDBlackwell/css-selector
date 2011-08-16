require 'test_helper'

class ConstantsCssSelectorTest < ActiveSupport::TestCase

  test 'constants' do
    assert_equal '0.0.0', CssSelector::VERSION
  end

end
