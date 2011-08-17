require 'css_string_namespace/css_string/private_instance_methods'
require 'css_string_namespace/css_string/public_instance_methods'

module CssStringNamespace
  class CssString < String
    include ::CssStringNamespace::CssString::PrivateInstanceMethods
    include ::CssStringNamespace::CssString::PublicInstanceMethods
  end
end
