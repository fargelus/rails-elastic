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
    else
      render 'new'
    end
  end

  def search; end
end
