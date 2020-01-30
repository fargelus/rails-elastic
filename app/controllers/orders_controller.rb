# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    begin
      @order.create!
      redirect_to root_path
    rescue StandardError
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :title,
      :description,
      :price,
      :date,
      :user_id
    )
  end
end
