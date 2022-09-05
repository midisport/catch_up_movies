class AddSeenToInterests < ActiveRecord::Migration[7.0]
  def change
    add_column :interests, :seen, :boolean, default: false
  end
end
