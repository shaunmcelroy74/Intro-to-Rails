class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order(Arel.sql("CAST(gross_sales AS REAL) DESC"))
  end

  def show
    @books = Book.find(params[:id])
  end
end
