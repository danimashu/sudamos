class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :thumbnail_link
      t.string :title
      t.text :teaser
      t.text :body
      t.boolean :published, default: false
      t.boolean :important, default: true

      t.string :slug

      t.timestamps
    end
    add_index :articles, :slug
  end
end
