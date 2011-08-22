CssSelector
===========

This plugin aids Rails (application) testing (using assert_select). It does this by giving you:

* A CSS selector object system (somewhat like Pathname for filesystem paths), and
* Additional assertion methods.

Example
=======

With this plugin, instead of:

```ruby
assert_select 'div.some-div > form > input.an-input[text]', 'some-value'
```

you can say:

```ruby
s=DIV.css_class 'some-div'
f=s.child FORM
i=f.child(INPUT).css_class 'an-input'
t=i.attribute TEXT
assert_select t, 'some-value'
```

(From the plugin test file, [test/standalone/example_test.rb](test/standalone/example_test.rb).)

Here's how to use the plugin's assertion methods (with the above variables):

assert_descend
--------------

Instead of:

```ruby
assert_select f, 1, "#{f} count"
assert_select f.descend(i), 1, "#{f.descend i} count"
```

achieving the same effect, you can more simply say:

```ruby
assert_descend f, i
```

assert_single
-------------

Instead of:

```ruby
assert_select t, 1, "#{t} count"
assert_select t, 'some-value'
```

you can say:

```ruby
assert_single t, 'some-value'
```

If you have only one attribute ('t') on your webpage, then instead of:

```ruby
assert_select i, 1, "#{i} count"
assert_select "[#{t}]", 1, "#{t} count"
assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
assert_select "[#{t}=?]", 'some-value'
assert_select "#{i}[#{t}=?]", 'some-value'
```

you can say:

```ruby
assert_single [i, t], 'some-value'
```

Or if you have multiple attributes ('t') on your webpage, instead of:

```ruby
assert_select i, 1, "#{i} count"
assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
assert_select "#{i}[#{t}=?]", 'some-value'
```

you can say:

```ruby
assert_single [i, t], 'some-value', false
```

How To Install
==============

In your Rails application:

rails install plugin git://github.com/MarkDBlackwell/css-selector.git

Requirements
============

Certain constants (DIV, etc.) useful for testing a Rails app are not brought in automatically, to avoid pollution of your app's namespaces (outside the Rails testing environment).

Also, I haven't fully investigated how to include CssSelector (the module, automatically) in just that environment.

So you (yourself) should specify, in your app's test/test_helper.rb (or elsewhere):

```ruby
include CssStringConstants
include CssSelector
```

More Information
================

For more evangelizing, see [CSS selector objects and methods for testing in Ruby](http://markdblackwell.blogspot.com/2011/08/css-selector-objects-and-methods-for.html) and presentation, [Rails testing with CssString (or 'Css Selectors')](http://zymbelstern.com/mark/presentation/Rails-testing-with-CssString/sbook2.htm).

For background information, see:
* ActionDispatch::Assertions::SelectorAssertions: [APIdock](http://apidock.com/rails/ActionDispatch/Assertions/SelectorAssertions/), [RubyOnRails](http://api.rubyonrails.org/classes/ActionDispatch/Assertions/SelectorAssertions.html) or [RubyOnRails old](http://rails.rubyonrails.org/classes/ActionController/Assertions/SelectorAssertions.html)
* HTML::Selector: [APIdock](http://apidock.com/rails/HTML/Selector/) or [RubyOnRails](http://api.rubyonrails.org/classes/HTML/Selector.html)

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.
