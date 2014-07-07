module CompsocLibrary
  module Catalogue
    module_function

    def search(collection, params)
      CatalogueSearch.new(collection, params).results
    end
  end

  class CatalogueSearch

    KEYWORD_SEARCH_ATTRS = [
      :title,
      :author,
      :keywords,
    ]

    def initialize(collection, params)
      @collection = Array(collection)
      @params     = params || {}
      @keyword    = @params.delete :keyword
    end

    def results
      @collection.select { |book| matches? book }
    end

  private

    def matches?(book)
      param_match?(book) || keyword_match?(book)
    end

    def param_match?(book)
      @params.any? { |attr,search| attr_match? book, attr, search }
    end

    def keyword_match?(book)
      @keyword && KEYWORD_SEARCH_ATTRS.any? { |attr| attr_match? book, attr, @keyword }
    end

    def attr_match?(book, attr, search)
      !!String(book.send(attr)).downcase[search.downcase]
    end

  end
end
