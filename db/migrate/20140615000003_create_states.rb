class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :search_term
      t.integer :adverts_count, default: 0
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
