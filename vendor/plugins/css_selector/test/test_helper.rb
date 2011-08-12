# Per http://guides.rubyonrails.org/plugins.html , as of (changelog says) 'April 4, 2010.'

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/..'*4

## require 'rubygems'
## require 'active_support'

require 'test/unit'
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
require File.dirname(__FILE__) + '/../init'
require File.dirname(__FILE__) + '/../lib/css_string_namespace'
require File.dirname(__FILE__) + '/../lib/css_selector'
