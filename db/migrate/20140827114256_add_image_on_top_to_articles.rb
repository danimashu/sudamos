class AddImageOnTopToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_on_top, :boolean, default: false
  end
end
