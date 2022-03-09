class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[:show, :index]
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
end
