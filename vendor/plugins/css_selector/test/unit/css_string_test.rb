require 'test_helper'

=begin
require 'pathname'
plugin=Pathname(__FILE__).dirname.join('../../').cleanpath.realpath
# p plugin.to_s

#lib/css_selector2.rb 
#test/test_helper.rb 
#lib/css_string.rb 

%w[ init.rb ].each do |e|
  s = plugin.join(e).realpath
# p s.to_s
  require s
end

class CssStringTest < ActiveSupport::TestCase

#=begin
  test "+" do
    compare '', big.map{|e| CssString.new('v').+(*e) } # Keep without sugar.
    compare '', big.map{|e| CssString.new('v') +  e  }
  end

  test "ends" do
    %w[ first last ].each{|e| two_ways ' > ', e.to_sym, ":#{e}-child"}
  end

  test "not" do
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

  test "attribute" do
    assert_equal 'v', (CssString.new('v').attribute)
    a = %w[ a b c d ]
    arrays = (1..4).map{|n| a.take n}
    strings = %w@  v[a]  v[a=b]  v[a=b][c]  v[a=b][c=d]  @
    strings.zip(arrays).each{|s,a| two_ways_attribute s, a}
  end
#=end

#-------------
  private

  def two_ways_attribute s, a
    assert_equal s, (CssString.new('v').attribute *a)
    assert_equal s, (CssString.new('v').attribute  a)
  end

end
=end
