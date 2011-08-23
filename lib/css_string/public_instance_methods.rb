# CssString methods.

class CssString < String
  module PublicInstanceMethods
    public

# To a CSS selector, append all arguments as CSS selector adjacent elements.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   IMG.adjacent FORM ==> 'img + form' 

    def adjacent  *a; CssString.new a.flatten.unshift(self).join ' + ' end

# To a CSS selector, append all arguments as CSS selector child elements.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.first FORM ==> 'div > form' 

    def child     *a; CssString.new a.flatten.unshift(self).join ' > ' end

# To a CSS selector, append all arguments as CSS classes.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.css_class 'my' ==> 'div.my' 

    def css_class *a; CssString.new a.flatten.unshift(self).join  '.'  end

# To a CSS selector, append all arguments as CSS ID's.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.css_id 'my' ==> 'div#my' 

    def css_id    *a; CssString.new a.flatten.unshift(self).join  '#'  end

# To a CSS selector, append all arguments as CSS selector descendent elements.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.descend FORM ==> 'div form' 

    def descend   *a; CssString.new a.flatten.unshift(self).join  ' '  end

# To a CSS selector, append all arguments as CSS selector child elements.
# Make the last be the CSS first child element, of whatever is one level up (from it).
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.first FORM ==> 'div > form:first-child' 

    def first     *a; self.child(*a) + ':first-child'                  end

# To a CSS selector, append all arguments as CSS selector child elements.
# Make the last be the CSS last child element, of whatever is one level up (from it).
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.last FORM ==> 'div > form:last-child' 

    def last      *a; self.child(*a) +  ':last-child'                  end

# Append all arguments to a CSS selector, without any intervening characters. 
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   CssString('abc')+'def' ==> 'abcdef'

    def + *a
      return self if guard *a
      CssString.new [self, a].to_s
    end

# Append the (CSS selector) negation of all arguments.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) of arrays of strings or strings.
#
# Example:
#   DIV.not '.home' ==> 'div:not(.home)' 

    def not *a
      return self if guard *a
      s = ':not('
      self + s + (a.flatten.join ')' + s) + ')'
    end

# Append a list of CSS attributes.
#
# The argument list can be: 
#
# A single, (non-array) string, or
#
# An array (or multiple arguments) (odd- or even-sized) of strings, which form CSS attribute name-value pairs consecutively.
#
# If the array size is an odd number, the last, named CSS attribute will be included without any CSS attribute value,
# in forming the CSS selector.
#
# Example:
#   IMG.attribute 'src', 'abc' ==> 'img[src=abc]' 

    def attribute *array
      return self if guard *array
      r = self.clone
      a = array.flatten
      n_full_pairs, n_unpaired = a.length.divmod 2
      (1..n_full_pairs + n_unpaired).each do |i|
        r << '[' + a.shift
        r << '=' + a.shift unless i > n_full_pairs
        r << ']'
      end
      CssString.new r
    end

  end
end
