module CssStringNamespace
  class CssString < String
    include ::CssStringNamespace::CssString::PublicInstanceMethods
    include ::CssStringNamespace::CssString::PrivateInstanceMethods
  end
end
