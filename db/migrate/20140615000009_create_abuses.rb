class CreateAbuses < ActiveRecord::Migration
  def change
    create_table :abuses do |t|
      t.integer :advert_id

      t.timestamps
    end

    add_index :abuses, :advert_id
  end
end
