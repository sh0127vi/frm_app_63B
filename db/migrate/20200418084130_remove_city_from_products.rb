class RemoveCityFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :city, :integer
  end
end
