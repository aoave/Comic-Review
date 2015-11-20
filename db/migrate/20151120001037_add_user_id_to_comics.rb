class AddUserIdToComics < ActiveRecord::Migration
  def change
    add_column :comics, :user_id, :string
    add_column :comics, :integer, :string
  end
end
