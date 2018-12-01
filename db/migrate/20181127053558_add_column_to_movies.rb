class AddColumnToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :images, :string, default: [].to_yaml
  end
end
