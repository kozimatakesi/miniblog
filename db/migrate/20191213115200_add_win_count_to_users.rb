class AddWinCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :win_count, :integer
  end
end
