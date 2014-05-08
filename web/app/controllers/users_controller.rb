class UsersController < ApplicationController
  layout "application"
  def new

  end

  def home
    render layout: "home"
  end

end
