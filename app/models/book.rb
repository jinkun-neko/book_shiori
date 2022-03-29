class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :diaries , foreign_key: 'book_id'
  has_one :page , foreign_key: 'book_id'
  
  validates :title,  presence: true,  length: { maximum: 50 }, uniqueness: true
  validates :author, presence: false, length: { maximum: 50 }
  validates :pages, presence: true, numericality: { only_integer: true, message: "は数字/半角のみです"}
  validates :new_date, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
end
