class CssString < String
  module PrivateInstanceMethods
    private

    def guard *a
      is_blank a
    end

    def is_blank a
# TODO: pare down these blank states only to the useful.
      a.nil? || a.empty? ||
          ((a.kind_of? String) && a.strip.empty?) ||
          ((a.kind_of? Array)  && a.reject{|e| is_blank e}.empty?)
    end

  end
end
