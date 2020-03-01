class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.reference       :buyer       null: false
      t.reference       :product     null: false
      t.timestamps
    end
  end
end
