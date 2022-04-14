class TakeTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :take_answers
  accepts_nested_attributes_for :take_answers
  has_many :take_multiple_choices
  accepts_nested_attributes_for :take_multiple_choices

end
