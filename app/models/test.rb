class Test < ApplicationRecord
  has_many :open_questions, :dependent => :destroy
  accepts_nested_attributes_for :open_questions
  has_many :multiple_choice_questions, :dependent => :destroy
  accepts_nested_attributes_for :multiple_choice_questions
end
