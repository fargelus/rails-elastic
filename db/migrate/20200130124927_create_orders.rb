# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.datetime :date
      t.belongs_to :user

      t.timestamps
    end
  end
end
