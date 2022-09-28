class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    
    book.save
    
    redireect_to '/top'

  def index
  end

  def show
  end

  def edit
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
