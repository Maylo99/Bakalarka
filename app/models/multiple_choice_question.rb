class MultipleChoiceQuestion < ApplicationRecord
  has_many :choices, :dependent => :destroy
  belongs_to :test,optional: true
  accepts_nested_attributes_for :choices
end
