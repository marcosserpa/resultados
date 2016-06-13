class User < ActiveRecord::Base
  has_many :pages

  validates :email, presence: true
  validates :token, presence: true
end
