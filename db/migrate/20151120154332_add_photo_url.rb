class AddPhotoUrl < ActiveRecord::Migration
  def change
    add_column :comics, :photo_url, :string
  end
end
