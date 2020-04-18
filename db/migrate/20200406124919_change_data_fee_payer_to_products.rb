class ChangeDataFeePayerToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :fee_payer, :string
  end
end
