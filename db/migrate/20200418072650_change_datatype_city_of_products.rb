class ChangeDatatypeCityOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :city, :integer
  end
end
