class BooksController < ApplicationController
  def index
    @books = Book.order("Publishing_Year DESC")
  end

  def show
    @books = Book.find(params[:id])
  end
end
