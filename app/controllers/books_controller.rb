class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
     redirect_to show_books_path(@book.id)
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
    redirect_to action: :show and return

   end
  end

  def destroy
    books = Book.find(params[:id])
   if books.destroy
      redirect_to '/books'
   else
      render :edit
   end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end