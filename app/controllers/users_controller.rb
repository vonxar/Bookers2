class UsersController < ApplicationController
	before_action :authenticate_user!
    def create
        @user = User.new
        @user.save
    end
	def index
        @user = current_user
        @book = Book.new
        @users =User.all
    end
    def update
    	@user =User.find(params[:id])
    	if @user.update(user_params)
    	flash[:notice] ="You have updated user successfully."
    	redirect_to user_path(@user.id)
    else
    	render :edit
    end
    end
    def show
    	@user = User.find(params[:id])
    	@books = @user.books
    	@book = Book.new
    	@bookall = Book.all
    	@users = User.all

    end
    def edit
    	@user = User.find(params[:id])
    if  @user.id != current_user.id
        redirect_to user_path(current_user.id)
    end
    end

    private
    def user_params
    	params.require(:user).permit(:name,:profile_image)
    end

    #  def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_url) unless @user == current_user
    # end
end
