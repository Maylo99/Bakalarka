#virtual password
# virtual password_confirmation
class User < ApplicationRecord
  has_secure_password
  has_many :comentars, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :course_registers
  validates :name, presence: true
  validates :age, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "please enter email in correct format"}, uniqueness: true,on: :create
  validates :password, length: { minimum: 6, maximum: 15 },on: :create
  validates :password_confirmation, length: { minimum: 6, maximum: 15 },on: :create
end
