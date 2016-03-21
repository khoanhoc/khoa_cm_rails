class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.text :note
      t.string :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
