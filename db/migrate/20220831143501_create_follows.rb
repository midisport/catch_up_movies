class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: true
      t.references :followed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
