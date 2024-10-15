class UsersController < ApplicationController
  def index
    @users = User.all
    # render json: ::UserBlueprint.render(@users, root: :users, view: :full)

    # render json: @users
  end
end
