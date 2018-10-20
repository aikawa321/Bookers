class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new
    @user = User.new
    @user = User.find_by(id: current_user.id)
  	@users = User.all
  end
  def show
    @books = Book.find_by(id: current_user.id)
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
  	@user = User.find(params[:id])
  if	@user.update(user_params)
  	redirect_to user_path(current_user.id), notice: "updated successfully"
  end
  render :edit
end
  	private
  	def user_params
  		params.require(:user).permit(:name, :introduction, :image)
    end
end