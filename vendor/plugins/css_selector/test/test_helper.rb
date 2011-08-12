# Followed the version of http://guides.rubyonrails.org/plugins.html
# as of April 4, 2010 (says its changelog).

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/..'*4

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
##require File.expand_path('../../config/environment', __FILE__)

## require 'rubygems'
## require 'rails/test_help'
## require 'active_support'

require 'test/unit'

require File.dirname(__FILE__) + '/../init'
require File.dirname(__FILE__) + '/../lib/css_string_namespace'
require File.dirname(__FILE__) + '/../lib/css_selector'
