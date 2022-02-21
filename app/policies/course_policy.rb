class CoursePolicy<ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def edit?
    admin? || teacher?
  end

  def create?
    admin? || teacher?
  end

  def new?
    admin? || teacher?
  end

  def destroy?
    admin?
  end



end