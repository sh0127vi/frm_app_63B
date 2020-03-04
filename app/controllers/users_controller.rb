class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    @user.build_address
    @user.save
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:sign_up, keys: [
        :nickname, 
        :f_name_kana, 
        :l_name_kana,
        :f_name,
        :l_name,
        :birthday,
        :phone_number,
        address_attributes: [:f_name_kana,
                              :l_name_kana,
                              :f_name,
                              :l_name,
                              :postal_code,
                              :prefecture,
                              :city,
                              :street,
                              :building
    ]])
  end
end
