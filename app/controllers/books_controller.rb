class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
    end
    def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
        flash[:notice] ="You have creatad book successfully."
    	redirect_to book_path(@book.id)
    else
    	@user = current_user
    	@users = User.all
    	@books = Book.all
    	render :index
    end
end
    def index
    	@book = Book.new
    	@books = Book.all
        @users = User.all
        @user = current_user

    end
    def show
    	@book = Book.find(params[:id])
    	@books =Book.all
        @newbook = Book.new
        @userss = @book.user
     if @userss == current_user
    	@user = current_user
    	else
    		@user =@userss
    	end
    end
    def edit
        @book = Book.find(params[:id])
        @user = current_user
        if @book.user_id != current_user.id
            redirect_to books_path
        end

end
    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
    	flash[:notice] ="You have updated book successfully."
        redirect_to book_path(@book.id)
    else
    	@user = current_user.id
    	render :edit
    end
    end
    def destroy
    	@book =Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    end

    private
    def book_params
    	params.require(:book).permit(:title ,:body,:image)
    end
end
