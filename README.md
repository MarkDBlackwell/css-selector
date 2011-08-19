CssSelector
===========

NOT READY YET.

This plugin helps Rails application testing (with assert_select). It
does this by:

o Giving you an object system for CSS selectors (somewhat like Pathname does
for filesystem paths), and

o Adding a couple of useful, assertion methods for them.

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

Requirements:

In test/test_helper.rb (or elsewhere), specify:

  include CssStringConstants

Because certain constants (DIV, etc.) useful in testing are not
automatically brought in, so as to avoid namespace-polluting your Rails
app.

For background information, see presentation, [Rails testing with CssString (or 
'Css 
Selectors')](http://zymbelstern.com/mark/presentation/Rails-testing-with-CssString/sbook2.htm) 
and/or blog post, [CSS selector objects and methods for testing in 
Ruby](http://markdblackwell.blogspot.com/2011/08/css-selector-objects-and-methods-for.html).

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.
