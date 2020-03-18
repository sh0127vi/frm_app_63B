class RemoveColumnFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :buyer_id,   :references
    remove_column :purchases, :product_id, :references
  end
end
