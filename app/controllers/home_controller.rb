# frozen_string_literal: true

class HomeController < ApplicationController
  def search
    @search_query = params[:query]
    respond_to do |format|
      format.json { render json: filtered_search_result }
    end
  end

  private

  def filtered_search_result
    search_result.map do |el|
      el.attributes.except('id', 'created_at', 'updated_at', 'user_id')
    end
  end

  def search_result
    user = User.search(@search_query, fields: [:email], limit: 1)
    orders = Order.search(@search_query, fields: %i[title description price])
    return user if user.first
    return orders if orders.first

    []
  end
end
