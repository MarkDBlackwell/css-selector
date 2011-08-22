class CssString < String
  module PublicInstanceMethods
    public

# adjacent

    def adjacent  *a; CssString.new a.flatten.unshift(self).join ' + ' end

# child

    def child     *a; CssString.new a.flatten.unshift(self).join ' > ' end

# css_class

    def css_class *a; CssString.new a.flatten.unshift(self).join  '.'  end

# css_id

    def css_id    *a; CssString.new a.flatten.unshift(self).join  '#'  end

# descend

    def descend   *a; CssString.new a.flatten.unshift(self).join  ' '  end

# first

    def first     *a; self.child(*a) + ':first-child'                  end

# last

    def last      *a; self.child(*a) +  ':last-child'                  end

# +

    def + *a
      return self if guard *a
      CssString.new [self, a].to_s
    end

# not

    def not *a
      return self if guard *a
      s = ':not('
      self + s + (a.flatten.join ')' + s) + ')'
    end

# attribute

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
