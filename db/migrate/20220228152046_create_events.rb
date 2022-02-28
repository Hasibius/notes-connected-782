class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.text :details
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
