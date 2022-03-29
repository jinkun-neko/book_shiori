class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[:show, :create, :new , :index, :update, :destroy]
  
  def new
    @book = Book.new  # 新規投稿用の空のインスタンス
  end
  
  def create
    @book = current_user.books.build(book_params)
    # @book = Book.new(book_params)  # フォームから送られてきたデータをストロングパラメータを経由して@bookに代入
    @book.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    if @book.save
      flash[:success] = "#{@book.title} を登録しました。"
      redirect_to @book
    else
      render 'new'
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to("/books/#{@book.id}")
    else
      render 'edit'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def index
    @books = Book.all.reverse_order
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:success] = "#{@book.title} を削除しました。"
  end

    private

  def book_params
    params.require(:book).permit(:id, :title, :author, :new_date, :pages, :image).merge(user_id: current_user.id)
  end
end