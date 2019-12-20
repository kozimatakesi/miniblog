class AddGameCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :game_count, :integer
  end
end
