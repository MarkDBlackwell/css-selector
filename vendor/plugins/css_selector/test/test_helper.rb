# Followed the version of http://guides.rubyonrails.org/plugins.html
# as of April 4, 2010 (says its changelog).

# Following:
# http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

ENV['RAILS_ENV'] = 'test'
backsteps = 5; s = (['..']*backsteps).join '/'
ENV['RAILS_ROOT'] ||= File.expand_path s, __FILE__
require File.expand_path 'config/environment', ENV['RAILS_ROOT']
require 'rails/test_help'

## print "ENV['RAILS_ROOT']="; p ENV['RAILS_ROOT']
## plugin_root = File.expand_path '../..', __FILE__
## has_lib = $LOAD_PATH.include? File.expand_path 'lib', plugin_root
## print 'has_lib='; p has_lib
