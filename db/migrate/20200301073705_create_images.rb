class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string       :images,   null: false
      t.references    :product, foregin_key: true, null: false
      t.timestamps
    end
  end
end
