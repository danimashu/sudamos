class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :professional, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :state_id, :integer
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :company_description, :text
    add_column :users, :slug, :string
  end
end
