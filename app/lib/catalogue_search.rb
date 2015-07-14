class CatalogueSearch

  def initialize(collection, params)
    @collection = Array(collection)
    @params     = params || {}
  end

  def results
    @collection.select { |book| matches? book }
  end

private

  def matches?(book)
    false # FIXME
  end

end
