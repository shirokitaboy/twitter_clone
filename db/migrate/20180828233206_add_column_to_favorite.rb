class AddColumnToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :tweet_id, :integer
  end
end
