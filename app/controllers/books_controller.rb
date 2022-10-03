class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:success] = "Book was successfully created."
     redirect_to books_path(book.id)
    else
     render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def updated
    book = Book.find(params[:id])
    book.update(book_params)
      redirect_to books_path(params[:id])
  end
  
  def destroy
    books = Book.find(params[:id])
    if books.destroy
      redirect_to '/books'
    else
      render :edit
  end
 end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end