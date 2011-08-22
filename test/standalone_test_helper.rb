# Following the April 4, 2010 (says its changelog) version of http://guides.rubyonrails.org/plugins.html 

# Following http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

## print '__FILE__=';p __FILE__
uplevels = 2
plugin_root = File.expand_path '../'*uplevels, __FILE__
$LOAD_PATH.unshift File.join *[plugin_root,'lib']
## print '$LOAD_PATH.join("\n")=';print $LOAD_PATH.join("\n")

require 'test/unit'
require 'rubygems'
gem 'mocha', '= 0.9.8'
require 'mocha'

gem 'activesupport', '= 3.0.9' # Do I use this?
## require 'activesupport' # Couldn't find how; use an include statement?
