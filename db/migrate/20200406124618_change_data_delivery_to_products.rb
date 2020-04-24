class ChangeDataDeliveryToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery, :string
  end
end
