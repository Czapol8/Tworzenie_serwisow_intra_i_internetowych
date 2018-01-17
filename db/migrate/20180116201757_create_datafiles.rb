class CreateDatafiles < ActiveRecord::Migration[5.1]
  def change
    create_table :datafiles do |t|
      t.string :name
      t.string :filen
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
