# frozen_string_literal: true

class Order < ApplicationRecord
  searchkick
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :date, presence: true
end
