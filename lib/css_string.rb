require 'css_string/private_instance_methods'
require 'css_string/public_instance_methods'

class CssString < String
  include ::CssString::PrivateInstanceMethods
  include ::CssString::PublicInstanceMethods
end
