class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end
  def result
     @book = Book.find(params[:id])
  end

  def index
   
  end

  def new
    # 空のモデルをビューへ渡す
    @book = Book.new
     @books = Book.all.reverse_order
  end

  def create
     @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successflly created.'
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :new

    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
        book = Book.find(params[:id])
       if book.update(book_params)
        flash[:notice] = 'Book was successflly updated.'
      end
        redirect_to book_path(book.id)
  end

  def effect
     @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
   if book.destroy
    flash[:notice] = 'Book was successflly destroyed.'
    end
    redirect_to books_new_path
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end

end
