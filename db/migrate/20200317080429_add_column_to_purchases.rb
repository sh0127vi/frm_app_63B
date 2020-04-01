class AddColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :buyer,   foreign_key: { to_table: :users }
    add_reference :purchases, :product, foreign_key: true
  end
end
