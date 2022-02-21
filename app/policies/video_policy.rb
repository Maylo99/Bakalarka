class VideoPolicy<ApplicationPolicy
  def edit?
    admin? or teacher?
  end

  def destroy?
    admin?
  end
  def new?
    admin? or teacher?
  end
end
