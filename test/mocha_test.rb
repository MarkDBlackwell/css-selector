#require 'test_helper'
require 'rubygems'
require 'test/unit'
require 'mocha'

class MochaTest < Test::Unit::TestCase

  def test_mocha
    s=String.new
    s.expects(:hello).at_least_once
  end

end
