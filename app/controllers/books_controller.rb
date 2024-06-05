class BooksController < ApplicationController

  def books
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book , notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
     render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = 'Book was successfully deleted.'
      redirect_to books_books_path
    else
      redirect_to books_books_path, notice: "something went wrong.."
    end
  end


private

  def book_params
    params.require(:book).permit(:title, :publisher , :price, :author_id)
  end

end
