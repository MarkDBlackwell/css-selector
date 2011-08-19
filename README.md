CssSelector
===========

NOT READY YET.

This plugin aids Rails application testing (with assert_select). It does this
by:

o Supplying an object system for CSS selectors (somewhat like Pathname does for
filesystem paths), and

o Adding a couple of assertion methods for them.

Example
=======

For example, with this plugin, instead of:

  assert_select 'div.some-div > form > input.an-input[text]', 'some-value'

you can say:

  s=DIV.css_class 'some-div'
  f=s.child FORM
  i=f.child(INPUT).css_class 'an-input'
  t=i.attribute 'text'
  assert_select t, 'some-value'

(From the plugin test file, 'test/standalone/example_test.rb'.)

Here's how to use the (couple of) additional assertion methods (with the above
variables assumed):

With assert_descend, instead of:

  assert_select f, 1, "#{f} count"
  assert_select f.descend(i), 1, "#{f.descend i} count"

achieving the same effect, you can more simply say:

  assert_descend f, i

With assert_single, instead of:

  assert_select t, 1, "#{t} count"
  assert_select t, 'some-value'

you can say:

  assert_single t, 'some-value'

If you have only one attribute, 't' on your webpage, instead of:

  assert_select i, 1, "#{i} count"
  assert_select "[#{t}]", 1, "#{t} count"
  assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
  assert_select "[#{t}=?]", 'some-value'
  assert_select "#{i}[#{t}=?]", 'some-value'

you can say:

  assert_single [i, t], 'some-value'

Or if you have multiple attributes, 't' on your webpage, instead of:

  assert_select i, 1, "#{i} count"
  assert_select "#{i}[#{t}]", 1, "#{i}, #{t} count"
  assert_select "#{i}[#{t}=?]", 'some-value'

you can say:

  assert_single [i, t], 'some-value', false

Requirements
===========

In test/test_helper.rb (or elsewhere), specify:

  include CssStringConstants

Certain constants (DIV, etc.) useful for testing a Rails app are not 
automatically brought in, in order to avoid polluting your main app's top-level 
namespace.

For background information, see the presentation, [Rails testing with CssString 
(or 'Css 
Selectors')](http://zymbelstern.com/mark/presentation/Rails-testing-with-CssString/sbook2.htm) 
and/or blog post, [CSS selector objects and methods for testing in 
Ruby](http://markdblackwell.blogspot.com/2011/08/css-selector-objects-and-methods-for.html) 
and the plugin file, 'test/notes'.

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.
