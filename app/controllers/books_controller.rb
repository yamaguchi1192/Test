class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :edit_block, only: [:edit]
	
	def edit_block
		@book = Book.find(params[:id])
		if current_user.id != @book.user.id
			redirect_to books_path
		end
	end

	def create
		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		if @book.save
	      flash[:notice] = "You have creatad book successfully."
		  redirect_to book_path(@book.id)
		else
			render :index
		end
	end

	def show
		@book =Book.find(params[:id])
		@book_new = Book.new
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
		
	end

	def edit
		@book = Book.find(params[:id])
		if current_user != @book.user
			redirect_to book_path

		end

	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book.id)
		else
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
		redirect_to books_path
	end

	end

	private

	def  book_params
		params.require(:book).permit(:title,:body)
	end



end