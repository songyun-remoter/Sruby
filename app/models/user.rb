class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, :password, presence: true
end
