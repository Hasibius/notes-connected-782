class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :score
      t.references :reviewer, null: false, foreign_key: { to_table: :user }
      t.references :artist, null: false, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end
