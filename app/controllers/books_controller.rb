class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("Publishing_Year DESC")
  end

  def show
    @books = Book.find(params[:id])
  end
end
