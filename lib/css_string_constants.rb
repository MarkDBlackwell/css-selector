require 'css_string'

# Constants for constructing composite CssStrings.

module CssStringConstants

    %w[
    A ACTION BODY CLASS COMMIT DIV
    FORM HEAD HREF HTML IMG INPUT LABEL NAME NONE
    SCRIPT SRC STYLE SUBMIT TABLE TARGET TEXT TITLE TYPE VALUE
        ].each{|e| self.const_set e.upcase.to_sym, (CssString.new e.downcase)}

#        ].each do |e|
#      self.const_set e.upcase.to_sym, (CssString.new e.downcase)
#    end
 
end
