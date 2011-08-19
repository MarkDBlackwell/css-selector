require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'css_string'

class CssStringTest < Test::Unit::TestCase

  def test_we_have_CssString
    assert defined?(CssString), 'missing CssString'
  end

  def test_common
    padded = [ ?> , ?+       ]. map{ |e| " #{e.chr} "}
    bare   = [ ?. , ?# , ?\s ]. map{ |e|     e.chr   }
    methods = %w[ child  adjacent    css_class  css_id  descend ]
    padded.concat(bare).zip(methods).each{|s,m| two_ways s, m.to_sym}
  end

  def test_plus
    compare '', big.map{|e| CssString.new('v').+(*e) } # Keep without sugar.
    compare '', big.map{|e| CssString.new('v') +  e  }
  end

  def test_ends
    %w[ first last ].each{|e| two_ways ' > ', e.to_sym, ":#{e}-child"}
  end

  def test_not
# An empty array shouldn't alter it.
    assert_equal 'v', (CssString.new('v').not [])
# Increasing strings...
    a = %w[  v  v:not(a)  v:not(a):not(b)  v:not(a):not(b):not(c)  ]
# With an increasing list...
    b = %w[  a  b  c ]
    ((1..3).map{|n| b.take n}.unshift ['']).zip(a).each do |z,s|
# Should match...
# As arguments.
      assert_equal s, (CssString.new('v').not *z)
# As a passed array.
      assert_equal s, (CssString.new('v').not  z)
    end
  end

  def test_attribute
    assert_equal 'v', (CssString.new('v').attribute)
    a = %w[ a b c d ]
    arrays = (1..4).map{|n| a.take n}
    strings = %w@  v[a]  v[a=b]  v[a=b][c]  v[a=b][c=d]  @
    strings.zip(arrays).each{|s,a| two_ways_attribute s, a}
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

  def two_ways_attribute s, a
    assert_equal s, (CssString.new('v').attribute *a)
    assert_equal s, (CssString.new('v').attribute  a)
  end

end
