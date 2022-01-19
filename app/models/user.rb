#virtual password
# virtual password_confirmation
class User < ApplicationRecord
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments
end
# validates :name, presence: true
# validates :age, presence: true
# validates :last_name, presence: true
# validates :gender, presence: true
# validates :email, presence: true
# validates :password_digest, length: { minimum: 6, maximum: 15 }