class CatalogueSearch

  def initialize(collection, params)
    @collection = Array(collection)
    @params     = params || {}

    @title = String(@params[:title]).downcase.presence
    @author = String(@params[:author]).downcase.presence
    @keyword = String(@params[:keyword]).downcase.presence
  end

  def results
    @collection.select { |book| matches? book }
  end

private

  def matches?(book)
    case
    when @title     then book.title.downcase[@title]
    when @author    then book.author.downcase[@author]
    when @keyword   then book.keyword_array.include?(@keyword)
    end
  end

end
