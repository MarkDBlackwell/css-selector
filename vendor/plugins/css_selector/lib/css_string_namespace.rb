#@+leo-ver=5-thin
#@+node:georgesawyer.20110806135445.1333: * @file css_string.rb
module CssStringNamespace
  module Constants

    %w[ A BODY DIV FORM HEAD HTML IMG INPUT LABEL SCRIPT STYLE TABLE TITLE
        ].each do |e|
      self.const_set e.upcase.to_sym, (CssString.new e.downcase)
    end

  end
  include Constants
end
#@-leo
