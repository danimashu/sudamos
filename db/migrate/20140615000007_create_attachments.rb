class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :advert_id
      t.boolean :main, default: false
      t.text :transloadit_response
      t.string :lg_url
      t.string :md_url
      t.string :sm_url

      t.timestamps
    end

    add_index :attachments, :advert_id
  end
end
