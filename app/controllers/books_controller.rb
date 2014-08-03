class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @new_book = Book.new
  end

  def create
    @book = current_user.books.build(user_params)
    if @book.save
      flash[:success] = "¡Libro añadido!"
      redirect_to current_user
    else
      flash[:success] = "¡Error al crear el libro! ¡A correr en círculos!"
      redirect_to current_user
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(user_params)
      flash[:success] = "Libro actualizado"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
    end
    flash[:notice] = "Removed book."
    redirect_to current_user
  end

  private
    def user_params
      params.require(:book).permit(:title, :author, :genre, :description)
    end
end
