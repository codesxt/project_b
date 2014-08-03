class LoansController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    flash[:notice] = "Petición Denegada."
    redirect_to :back
  end

  def request_loan
    @book = Book.find(params[:id])
    if Loan.create!(:user_id => current_user.id, :book_id => @book.id, :status => 0)
      flash[:notice] = "Libro pedido."
      redirect_to @book
    else
      flash[:error] = "No se pudo pedir el libro."
      redirect_to @book
    end
  end

  def accept
    @loan = Loan.find(params[:id])
    @book = Book.find(@loan.book_id)
    @loan.status = 1
    @loan.save
    Loan.delete_all('book_id' => @book.id, 'status' => 0)
    flash[:notice] = "Libro prestado."
    redirect_to :back
  end

  def book_returned
    @loan = Loan.find(params[:id])
    @loan.status = 2
    @loan.save
    flash[:notice] = "Te devolvieron este libro."
    redirect_to :back
  end
end
