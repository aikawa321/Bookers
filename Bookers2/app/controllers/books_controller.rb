class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
  def index
    @book = Book.new
    @books = Book.all
    @user = User.new
     @user = User.find_by(id: current_user.id)
  end

  def new
  	@book = Book.new
  end

  def create
  	 @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
    flash[:notice]="Book created, successfully"
  	redirect_to book_path(@book)
   else
     @books = Book.all
     @user = User.new
     @user = User.find_by(id: current_user.id)
     render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end
  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
       if @book.update(book_params)
        redirect_to book_path, notice:"Updated successfully"
      end
      render :edit
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path, notice: "Deleted successfully"
  end

  private
        def book_params
        	params.require(:book).permit(:title, :opinion, :user_id)
        end

        def user_params
          params.require(:user).permit(:name, :introduction, :image)
        end


        def correct_user
           book = current_user.books.find_by(id: params[:id])
            unless book
              redirect_to books_path
            end
        end
end
