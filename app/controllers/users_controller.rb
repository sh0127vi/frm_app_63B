class UsersController < ApplicationController
  def index
  end

  def logout
  end

  def card
  end

  def card_add
  end

  def create
  end

  def edit
  end

  def update
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
        address_attributes: [:f_name_kana,
                              :l_name_kana,
                              :f_name,
                              :l_name,
                              :postal_code,
                              :prefecture,
                              :city,
                              :street,
                              :building,
                              :phone_number,
                              :id
                              ]])
  end
end
