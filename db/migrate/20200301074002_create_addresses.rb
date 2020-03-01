class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string        :f_name_kana,     null: false
      t.string        :l_name_kana,     null: false
      t.string        :f_name,          null: false
      t.string        :l_name,          null: false
      t.integer       :postal_code,     null: false
      t.string        :prefecture,      null: false
      t.string        :city,            null: false
      t.string        :street,          null: false
      t.string        :building,        null: false
      t.references    :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
