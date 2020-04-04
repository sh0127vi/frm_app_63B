class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :images,:string, null: true 
  end

  def down
    change_column :images, :images,:string, null: false
  end
end
