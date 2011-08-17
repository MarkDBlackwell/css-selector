class CssString < String
  module PrivateInstanceMethods
    private

    def guard *a
      return true if a.blank?
      a = a.flatten
      a.blank? || ['']==a
    end

  end
end
