class User < ApplicationRecord
  validates :user_name, :user_email, presence: true
  has_many  :posts 

  #detect  得到一个键值对
  #present 不是空格
  def self.find_by_name(username)
    if username.present?
      # First look for an exact match
      user = self.find_by(user_name: username)
    end
  end

  def authenticate(password)
    return self.user_password == password 
  end

end
