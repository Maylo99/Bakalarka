class Course < ApplicationRecord
  has_many :videos
  def title_name
    "#{title}"
  end
end
