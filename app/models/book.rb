class Book < ApplicationRecord
  belongs_to :author


  validates :title, presence: true
  validates :publisher, presence: true
  validates :price, presence: true
end
