class Change < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :posterurl, :poster_url
  end
end
