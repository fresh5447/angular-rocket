class FavoritePolicy < ApplicationPolicy
  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

  def create
  	destroy?
  end
end