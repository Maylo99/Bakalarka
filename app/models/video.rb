class Video < ApplicationRecord
  has_one_attached :file
  belongs_to :course
  has_many :comentars, dependent: :destroy
  validates :title,presence: true
  validates :course_id,presence: true
  validates :file,presence: true
end
