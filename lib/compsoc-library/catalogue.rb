module CompsocLibrary
  module Catalogue
    module_function

    def search(collection, params)
      collection.select { |b|
        params.any? { |k,v| s = b[k] and s[v] } ||
        (k = params[:keyword] and b.keywords[k])
      }
    end
  end

end
