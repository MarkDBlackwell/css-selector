require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_string_namespace'

# class ConstantsCssStringNamespaceTest < ActiveSupport::TestCase
class ConstantsCssStringNamespaceTest < Test::Unit::TestCase
  include ::CssStringNamespace

  def test_constants
    %w[
        A BODY DIV FORM HEAD HTML IMG INPUT LABEL SCRIPT STYLE TABLE TITLE
        ].each do |e|
      c = Kernel.eval e # Method, 'const_get' did not work here.
      assert_equal c, e.downcase
    end
  end

end
