# frozen_string_literal: true

module ApplicationHelper
  def any_user_exist?
    User.first.present?
  end
end
