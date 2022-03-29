class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @page = Page.new  
  end

  def create
      @page = Page.find_or_initialize_by(page_params)
      book_pages = @book.pages
    if @page.new_record?
      @page.save!
      p = percent(book_pages,@page)
      @percent = "#{p} %"
      @praise = praise(p)
      render action: :show
    else
      @page.update(page_params)
      render action: :show
      # redirect_to @book
    end
  end

  private

    def page_params
      params.permit(:now_pages, :book_id) 
    end
end
