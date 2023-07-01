class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movierecord, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, %i[user_id movierecord_id], unique: true
  end
end
