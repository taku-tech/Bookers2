class BooksController < ApplicationController
	before_action :authenticate_user!
	def index
		@books = Book.all
		@new_post = Book.new
		@user = current_user
	end

	def create
		@books = Book.all
		@new_post = Book.new(book_params)
		@user = current_user
		@new_post.user_id = current_user.id
		if @new_post.save
			redirect_to book_path(@new_post.id), notice: 'You have created book successfully.'
		else
			render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@new_post = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

		def book_params
			params.require(:book).permit(:title, :body)
		end

end