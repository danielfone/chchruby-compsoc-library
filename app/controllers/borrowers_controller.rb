class BorrowersController < ApplicationController

  def index
    @borrowers = Borrower.all
  end

  def new
    @borrower = Borrower.new
  end

  def loans
    @borrower = Borrower.find params[:id]
  end

  def create
    @borrower = Borrower.create params[:borrower]
    flash[:notice] = 'Borrower saved' if @borrower.persisted?
    redirect_to borrowers_path
  end

  def edit
    @borrower = Borrower.find params[:id]
  end

  def update
    @borrower = Borrower.find params[:id]
    @borrower.update_attributes params[:borrower] and flash[:notice] = 'Borrower saved'
    respond_with @borrower, location: borrowers_path
  end

  def destroy
    @borrower = Borrower.find params[:id]
    @borrower.destroy and flash[:notice] = 'Borrower deleted'
    respond_with @borrower, location: borrowers_path
  end

end
