require 'css_string'

module CssSelector
  module PublicInstanceMethods
    public

# Asserts a match, under test, of one CssString object, 'b' descended from another such, 'a'.

    def assert_descend a, b
      assert_select b, 1
      assert_select a.descend(b), 1
    end

# The second argument (as with Rails' assert_select) is a value either meaning: tag content, or a CSS attribute value.
#
# Asserts, under test, that there is a single match, having a given value, of optionally:
#
# (1) A single String object, or
#
# (2) A single String object along with an entire list of name-value attribute pairs (as Strings), or
#
# (3) A single String object, both with, and without, an entire list of name-value attribute pairs.
#
# Note: since class, CssString descends from String, they will work, too.
#
# Option (2) pertains when 'false' is given as the last argument.
#
# The first argument is either:
#
# A (non-array) string, or
#
# An array of two objects, the first element being a (non-array) string.
#
# Then, the second element is passed to CssString#attribute, so it can be either:
#
# A (non-array) string, or
#
# An array (odd- or even-sized) of strings, which form CSS attribute name-value pairs consecutively.
#
# If the array size is an odd number, the last, named CSS attribute will be included without any CSS attribute value,
# in forming the CSS Selector.

    def assert_single selector, value, also_attribute_alone=true
      if (was_array=selector.kind_of? Array)
        raise unless 2==selector.length
        s,a=*selector
      else
        s=selector
      end
      s ||= ''
      s=CssString.new(s) unless s.kind_of? CssString
      unless was_array
        assert_select s, 1, s+' count'
        assert_select s, value
      else
# TODO: pare down these blank states to only the useful.
        is_blank = s.nil? || s.empty? ||
            ((s.kind_of? String) && s.strip.empty?) ||
            ((s.kind_of? Array)  && s.flatten.empty?)
        assert_select s, 1 unless is_blank
        (! also_attribute_alone ? [s] : [s, CssString.new]).each do |e|
          assert_select e.attribute(a), 1
          assert_select e.attribute(a,'?'), value
        end
      end
    end

  end
end
