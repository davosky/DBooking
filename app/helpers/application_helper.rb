# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def user_full
    current_user.name + ' ' + current_user.surname + ' | ' + current_user.category + ' | ' + current_user.office
  end

  def admin?
    current_user.user_type == 'admin'
  end

  def manager?
    current_user.user_type == 'manager'
  end

  def regular?
    current_user.user_type == 'regular'
  end
end
