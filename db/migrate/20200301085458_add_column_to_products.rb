class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string,           null: false
    add_column :products, :detail, :text,           null: false
    add_column :products, :price, :integer,         null: false
    add_column :products, :condition, :string,      null: false
    add_column :products, :city, :string,           null: false
    add_column :products, :delivery, :integer,      null: false
    add_column :products, :fee_payer, :integer,     null: false
    add_column :products, :delivery_area, :string,  null: false
  end
end
