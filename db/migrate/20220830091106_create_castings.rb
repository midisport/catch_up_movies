class CreateCastings < ActiveRecord::Migration[7.0]
  def change
    create_table :castings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
