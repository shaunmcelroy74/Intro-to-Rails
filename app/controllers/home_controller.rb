class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("sale_rank").limit(10)
    @publishers = Publisher.all
  end
end
