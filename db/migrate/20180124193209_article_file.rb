class ArticleFile < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :chartFile, :string
  end
end
