class Page < ApplicationRecord
  belongs_to :book 
  validates :now_pages, presence: true
end
