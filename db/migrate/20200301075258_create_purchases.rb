class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references       :buyer,       null: false
      t.references       :product,     null: false
      t.timestamps
    end
  end
end
