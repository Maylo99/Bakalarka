class OpenQuestion < ApplicationRecord
  belongs_to :test
  validates :question, presence: true
  validates :correctAnswer, presence: true
  validates :points, presence: true
end
