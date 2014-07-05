class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create params[:book]
    flash[:notice] = 'Book saved' if @book.persisted?
    respond_with @book, location: books_path
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    @book.update_attributes params[:book]
    respond_with @book, location: books_path
  end

end
