class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :advert_id
      t.string :email
      t.text :message
      t.boolean :read, default: false
      t.boolean :newsletter, default: false

      t.timestamps
    end

    add_index :contacts, :user_id
    add_index :contacts, :advert_id
  end
end
