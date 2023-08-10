class CreateMovierecords < ActiveRecord::Migration[7.0]
  def change
    create_table :movierecords do |t|
      t.string :title, null: false
      t.string :image_url
      t.string :viewing_style, null: false
      t.integer :star
      t.text :review, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
