class TakeTest < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :test, optional: true
  has_many :take_answers, dependent: :destroy
  accepts_nested_attributes_for :take_answers,allow_destroy: true
  has_many :take_multiple_choices,dependent: :destroy
  accepts_nested_attributes_for :take_multiple_choices,allow_destroy: true

end
