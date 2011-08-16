require 'test_helper'

class ConstantsCssStringNamespaceTest < ActiveSupport::TestCase
  include CssStringNamespace

  test 'constants' do
    %w[
        A BODY DIV FORM HEAD HTML IMG INPUT LABEL SCRIPT STYLE TABLE TITLE
        ].each do |e|
      c = Kernel.eval e # Method, 'const_get' did not work here.
      assert_equal c, e.downcase
    end
  end

end
