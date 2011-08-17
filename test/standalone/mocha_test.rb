require File.dirname(__FILE__) + '/../standalone_test_helper'

class MochaTest < Test::Unit::TestCase

  def test_mocha
    s=String.new
    s.expects(:hello).at_least_once
  end

end
