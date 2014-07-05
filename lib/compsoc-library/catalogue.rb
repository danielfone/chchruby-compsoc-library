module CompsocLibrary
  module Catalogue
    module_function

    def search(collection, params)
      CatalogueSearch.new(collection, params).results
    end
  end

  class CatalogueSearch < Struct.new(:collection, :params)

    def initialize(collection, params)
      super Array(collection), Hash(params)
    end

    def results
      collection.select { |book| matches? book }
    end

  private

    def matches?(book)
      attr_match?(book) || keyword_match?(book)
    end

    def attr_match?(book)
      params.any? { |attr,search| value = book[attr] and value[search] }
    end

    def keyword_match?(book)
      keyword = params[:keyword] and book.keywords[keyword]
    end
  end
end
