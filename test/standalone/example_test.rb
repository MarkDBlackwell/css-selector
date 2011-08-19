require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_string'

class ExampleTest < Test::Unit::TestCase
  include CssStringConstants

# NOTE: this example is quoted extensively in README.md, so keep that parallel
# to this.

  def test_example
    s=DIV.css_class 'some-div'
    f=s.child FORM
    i=f.child(INPUT).css_class 'an-input'
    t=i.attribute 'text'
    assert_equal 'div.some-div > form > input.an-input[text]', t
  end

end

