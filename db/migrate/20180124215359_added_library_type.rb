class AddedLibraryType < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :lib, :string
  end
end
