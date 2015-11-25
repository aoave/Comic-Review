class AddUserIdToComics < ActiveRecord::Migration
  def change
    add_column :comics, :user_id, :string
    add_column :comics, :integer, :string # this column seems like it shouldn't be here
  end
end
