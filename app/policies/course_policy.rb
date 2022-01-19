class CoursesPolicy<ApplicationPolicy
  attr_reader :user, :course

  def update?
    user.admin? || !post.published?
  end
end