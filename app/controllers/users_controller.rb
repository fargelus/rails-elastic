# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params[:user][:email]
    @user = User.new(email: email)

    if @user.save
      redirect_to root_path
      User.reindex
    else
      render 'new'
    end
  end

  def search
    query = params[:query]
    search_results = User.search(query, fields: [:email], limit: 1)
    user = search_results.first
    result = user ? { id: user.id, email: user.email } : {}
    respond_to do |format|
      format.json { render json: result }
    end
  end
end
