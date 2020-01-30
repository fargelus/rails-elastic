# frozen_string_literal: true

class User < ApplicationRecord
  searchkick

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end
