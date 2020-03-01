class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_id,       :reference, null: false,  foreign_key: true
    add_column :products, :name,          :string,    null: false
    add_column :products, :detail,        :text,      null: false
    add_column :products, :category_id,   :reference, null: false,  foreign_key: true
    add_column :products, :price,         :integer,   null: false
    add_column :products, :condition,     :string,    null: false
    add_column :products, :city,          :string,    null: false
    add_column :products, :delivery,      :integer,   null: false
    add_column :products, :fee_payer,     :integer,   null: false
    add_column :products, :delivery_area, :integer,   null: false
  end
end
