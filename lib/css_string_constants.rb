require 'css_string_namespace/css_string'

module CssStringConstants

    %w[ A BODY DIV FORM HEAD HTML IMG INPUT LABEL SCRIPT STYLE TABLE TITLE
        ].each do |e|
      self.const_set e.upcase.to_sym, (CssString.new e.downcase)
    end
 
end
