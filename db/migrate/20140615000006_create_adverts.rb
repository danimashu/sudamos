class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.integer :user_id
      t.integer :state_id
      t.integer :section_id
      t.integer :sport_id
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :sell, default: true
      t.string :phone
      t.datetime :renewed_at
      t.boolean :retired, default: false
      t.boolean :important, default: false

      t.integer :viewed_count, default: 0
      t.integer :attachments_count, default: 0
      t.integer :abuses_count, default: 0

      t.string :slug

      t.timestamps
    end
    add_index :adverts, :user_id
    add_index :adverts, :state_id
    add_index :adverts, :section_id
    add_index :adverts, :sport_id
    add_index :adverts, :slug
  end
end
