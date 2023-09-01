class CreateMovierecordTags < ActiveRecord::Migration[7.0]
  def change
    create_table :movierecord_tags do |t|
      t.references :movierecord, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :movierecord_tags, %i[movierecord_id tag_id], unique: true
  end
end
