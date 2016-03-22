class Post < ApplicationRecord
  has_many :comments, dependent: :destroy #dependent: :destroy的作用是删除post时，同时删除附带的comments
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :body

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end


end
