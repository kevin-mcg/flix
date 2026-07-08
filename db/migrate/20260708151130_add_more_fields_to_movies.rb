class AddMoreFieldsToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :realisateur, :string
    add_column :movies, :film_length, :string
    add_column :movies, :image_file_nom, :string, default: "placeholder.png"
  end
end
