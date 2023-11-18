# frozen_string_literal: true

# RegistrationsController handles user registrations.

class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end
end
