ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/..'*4

require 'test/unit'
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
require File.dirname(__FILE__) + '/../init'
require File.dirname(__FILE__) + '/../lib/css_string_namespace'
require File.dirname(__FILE__) + '/../lib/css_selector'

# require 'rubygems'
# require 'active_support'
