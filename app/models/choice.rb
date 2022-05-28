class Choice < ApplicationRecord
  belongs_to :multiple_choice_question,optional: true
  validates :answer, presence: true
  validates :partialPoints, presence: true
  validates :is_true, presence: true
end
