class CatalogueSearch

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
    false
  end

end
