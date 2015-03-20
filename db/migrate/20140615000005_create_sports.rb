class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.string :search_term
      t.integer :adverts_count, default: 0

      t.timestamps
    end
  end
end