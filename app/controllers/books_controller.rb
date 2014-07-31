class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @new_book = Book.new
  end

  def create
    @book = current_user.books.build(user_params)
    if @book.save
      flash[:success] = "¡Libro añadido!"
      redirect_to root_path
    else
      flash[:success] = "¡NO!"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:book).permit(:title, :author, :genre, :description, :password_confirmation)
    end
end
