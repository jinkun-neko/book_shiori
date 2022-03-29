require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:book) {Book.new(title:"本",pages:300,author:"じんくん", new_date:("2018-7-30") , id: current_user.id) }

  it '有効であること' do
    expect(book).to be_valid
  end

  it 'user_idがない場合は、無効であること' do
    book = nil
    expect(book).to_not be_valid
  end

    describe 'title' do
      it '空なら無効であること' do
        book.title = '    '
        expect(book).to_not be_valid
      end
  end

    describe 'pages' do
      it '空なら無効であること' do
        book.pages = nil
        expect(book).to_not be_valid
      end
  end

    describe 'new_date' do
      it '空なら無効であること' do
        book.new_date = nil
        expect(book).to_not be_valid
      end
  end

    describe 'author' do
      it '空なら無効であること' do
        book.author = " "
        expect(book).to be_valid
      end
  end
end
