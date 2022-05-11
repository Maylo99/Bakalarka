#virtual password
# virtual password_confirmation
class User < ApplicationRecord
  has_secure_password
  has_many :comentars, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments
  validates :name, presence: true
  validates :age, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "please enter email in correct format"}
  validates :password, length: { minimum: 6, maximum: 15 }
  validates :password_confirmation, length: { minimum: 6, maximum: 15 }
end
