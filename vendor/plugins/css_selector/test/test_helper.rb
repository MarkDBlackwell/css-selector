# Followed the version of http://guides.rubyonrails.org/plugins.html
# as of April 4, 2010 (says its changelog).

# Following:
# http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

ENV['RAILS_ENV'] = 'test'
=begin
# backsteps = 5
backsteps = 2
s = (['..']*backsteps).join '/'
print "ENV['RAILS_ROOT']="; p ENV['RAILS_ROOT']
ENV['RAILS_ROOT'] ||= File.expand_path s, __FILE__
print "ENV['RAILS_ROOT']="; p ENV['RAILS_ROOT']
#exit
require File.expand_path 'config/environment', ENV['RAILS_ROOT']
=end
require 'rails/test_help'

## plugin_root = File.expand_path '../..', __FILE__
## has_lib = $LOAD_PATH.include? File.expand_path 'lib', plugin_root
## print 'has_lib='; p has_lib
