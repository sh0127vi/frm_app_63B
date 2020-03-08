class ChangePostalCodeOfAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :postal_code, "CHAR(7)", null: false
  end
  
  def down
    change_column :addresses, :postal_code, null: false
  end
end
