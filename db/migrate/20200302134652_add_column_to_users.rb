class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string,      null: false
    add_column :users, :f_name_kana, :string,   null: false
    add_column :users, :l_name_kana, :string,   null: false
    add_column :users, :f_name, :string,        null: false
    add_column :users, :l_name, :string,        null: false
    add_column :users, :birthday, :integer,     null: false
    add_column :users, :phone_number, :integer, null: false
  end
end
