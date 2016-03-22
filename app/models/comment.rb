class Comment < ApplicationRecord
  belongs_to :post
  has_many :users

  validates_presence_of :title
  validates_presence_of :body
end
