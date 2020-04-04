class RemoveDeliveryAreaToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :delivery_area, :string
  end
end
