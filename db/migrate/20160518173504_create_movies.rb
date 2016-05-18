class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :summary
      t.string :embed_link
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
