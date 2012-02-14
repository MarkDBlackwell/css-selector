#css-selector
A Rails plugin to aid in application testing (with assert_select). It does this by giving you:

* CSS selector objects (like Pathname's for filesystem paths), and
* Additional assertion methods

##Example Usage
With the plugin (see [example_test.rb](test/standalone/example_test.rb)) rather than

```ruby
assert_select 'div.some-div > form > input.an-input[text]', 'some-value'
```

you can say

```ruby
t=DIV.css_class('some-div').child(FORM,INPUT).css_class('an-input').attribute TEXT
assert_select t, 'some-value'
```

Or, breaking it down further

```ruby
s=DIV.css_class 'some-div'
f=s.child FORM
i=f.child(INPUT).css_class 'an-input'
t=i.attribute TEXT
assert_select t, 'some-value'
```

###assert_descend
Of course, the assertion methods can be used with the above variables. For the effect of

```ruby
assert_select f, 1, "#{f} count"
assert_select f.descend(i), 1, "#{f.descend i} count"
```

you can say, more simply

```ruby
assert_descend f, i
```

###assert_single
Instead of

```ruby
assert_select t, 1, "#{t} count"
assert_select t, 'some-value'
```

you can say

```ruby
assert_single t, 'some-value'
```

If you have one attribute ('t') on your webpage, instead of

```ruby
assert_select i, 1, "#{i} count"
assert_select "[#{t}]", 1, "#{t} count"
assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
assert_select "[#{t}=?]", 'some-value'
assert_select "#{i}[#{t}=?]", 'some-value'
```

you can say

```ruby
assert_single [i, t], 'some-value'
```

Or if you have multiple attributes ('t') on your webpage, instead of

```ruby
assert_select i, 1, "#{i} count"
assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
assert_select "#{i}[#{t}=?]", 'some-value'
```

you can say

```ruby
assert_single [i, t], 'some-value', false
```

##How To Install
In your Rails application, 'rails install plugin git://github.com/MarkDBlackwell/css-selector.git'.

##Requirements
Certain constants (e.g., DIV) useful in testing a Rails application are not brought in automatically. This avoids polluting your app namespace outside environment 'test'.

I haven't yet (fully) discovered how to include module CssSelector automatically in just that environment. Therefore, probably in (your app's) test/test_helper.rb, you should specify

```ruby
include CssStringConstants
include CssSelector
```

##Testing

Tested with Rails 3.0.9 & Ruby 1.8.7.
Please let me know if you find anything wrong with it!

An example testbed is at [css-selector-example](https://github.com/MarkDBlackwell/css-selector-example)

##More Information
Evangelizing: [CSS selector objects and methods for testing in Ruby](http://markdblackwell.blogspot.com/2011/08/css-selector-objects-and-methods-for.html) or presentation, [Rails testing with CssString (Css Selectors)](http://zymbelstern.com/mark/presentation/Rails-testing-with-CssString/sbook2.htm).

ActionDispatch::Assertions::SelectorAssertions: [APIdock](http://apidock.com/rails/ActionDispatch/Assertions/SelectorAssertions/), [RubyOnRails](http://api.rubyonrails.org/classes/ActionDispatch/Assertions/SelectorAssertions.html), [RubyOnRails (old)](http://rails.rubyonrails.org/classes/ActionController/Assertions/SelectorAssertions.html)

HTML::Selector: [APIdock](http://apidock.com/rails/HTML/Selector/), [RubyOnRails](http://api.rubyonrails.org/classes/HTML/Selector.html)

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.
