class CreateCinemas < ActiveRecord::Migration[7.0]
  def change
    create_table :cinemas do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :name
      t.string :type
      t.string :address

      t.timestamps
    end
  end
end
