class Video < ApplicationRecord
  has_one_attached :file
  belongs_to :course
  has_many :comentar
end
