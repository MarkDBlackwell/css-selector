require 'css_string'

module CssStringConstants

    %w[
    A ACTION BODY CLASS COMMIT DIV
    FORM HEAD HREF HTML IMG INPUT LABEL NAME NONE
    SCRIPT SRC STYLE SUBMIT TABLE TARGET TEXT TITLE TYPE VALUE
        ].each do |e|
      self.const_set e.upcase.to_sym, (CssString.new e.downcase)
    end
 
end
