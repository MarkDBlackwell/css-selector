require File.dirname(__FILE__) + '/test_helper'

## class CssStringTest < ActiveSupport::TestCase

class CssStringTest < Test::Unit::TestCase

  include CssStringNamespace

  def test_after_app_includes_CssStringNamespace
    assert defined?(CssString), 'missing CssString'
  end

##  test "common" do
  def test_common
    padded = [ ?> , ?+       ]. map{ |e| " #{e.chr} "}
    bare   = [ ?. , ?# , ?\s ]. map{ |e|     e.chr   }
    methods = %w[ child  adjacent    css_class  css_id  descend ]
    padded.concat(bare).zip(methods).each{|s,m| two_ways s, m.to_sym}
  end

#-------------
  private

  def args; (0...number_of_arguments).map{|i|(?a + i).to_s} end
  def number_of_arguments; 4 end

  def bigger; sliding_take 1, (args.unshift 'v') end
  def big   ; sliding_take 0, args               end

  def compare joiner, objects, append=''
    bigger.map{|e|(e.join joiner).concat append}.zip(objects).each do |s,o|
# The result...
# Should be a CssString:
      flunk "#{o} not CssString" unless o.kind_of? CssString
# Should be convertable to a string equal to the comparer:
      assert_equal s, o
    end
  end

  def sliding_take first, a
    (first...first + number_of_arguments).map{|n| a.take n}
  end

  def two_ways joiner, method, append=''
    compare joiner, big.map{|e| CssString.new('v').send method, *e}, append
    compare joiner, big.map{|e| CssString.new('v').send method,  e}, append
  end

end
