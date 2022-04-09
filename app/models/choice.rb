class Choice < ApplicationRecord
  belongs_to :multiple_choice_question,optional: true
end
