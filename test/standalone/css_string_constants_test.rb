require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_string_constants'

class CssStringConstantsTest < Test::Unit::TestCase
  include ::CssStringConstants

  def test_constants
    %w[
    A ACTION BODY CLASS COMMIT DIV
    FORM HEAD HREF HTML IMG INPUT LABEL NAME NONE
    SCRIPT SRC STYLE SUBMIT TABLE TARGET TEXT TITLE TYPE VALUE
        ].each do |e|
      c = Kernel.eval e # Method, 'const_get' did not work here.
      assert_equal c, e.downcase
    end
  end

end
