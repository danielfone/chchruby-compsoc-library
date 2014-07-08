class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def search
    @books = Library.search Book.all, keyword: params[:q]
    render :index
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
    @book.update_attributes params[:book] and flash[:notice] = 'Book saved'
    respond_with @book, location: books_path
  end

  def issue
    Library.issue_book book, borrower
    redirect_to :back
  end

  def return
    Library.return_book book
    redirect_to :back
  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy and flash[:notice] = 'Book deleted'
    respond_with @book, location: books_path
  end

private

  def book
    @book = Book.find params[:id]
  end

  def borrower
    @book = Borrower.find params[:borrower_id]
  end

end
