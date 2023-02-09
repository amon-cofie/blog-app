class AddDefaultPhotoToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, 'https://picsum.photos/id/237/200/300'
  end
end
