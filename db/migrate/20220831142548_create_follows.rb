class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: { to_table: :users } # user following another user
      t.references :followed, foreign_key: { to_table: :users } # user being followed by another user
      
      t.timestamps
    end
  end
end
