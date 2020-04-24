class UsersController < ApplicationController
  before_action :set_category

  def index
  end

  def logout
  end

  private

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end
end
