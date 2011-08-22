require 'css_string'

# Constants for constructing compound Css Strings.

module CssStringConstants

    %w[
    A ACTION BODY CLASS COMMIT DIV
    FORM HEAD HREF HTML IMG INPUT LABEL NAME NONE
    SCRIPT SRC STYLE SUBMIT TABLE TARGET TEXT TITLE TYPE VALUE
#        ].each do |e|
#      self.const_set e.upcase.to_sym, (CssString.new e.downcase)
#    end
        ].each{|e| self.const_set e.upcase.to_sym, (CssString.new e.downcase)}
 
end
