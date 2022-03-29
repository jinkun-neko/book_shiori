class DiariesController < ApplicationController
  def new
    @diary = Diary.new 
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      flash[:success] = "日記を登録しました。"
      redirect_to book_path
    else
      render 'new'
    end
  end
  
  def edit
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:now_pages, :book_id)
  end
end
