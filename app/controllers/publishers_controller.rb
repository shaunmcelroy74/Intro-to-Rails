class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show
    @publishers = Publisher.find(params[:id])
  end
end
