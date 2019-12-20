class AddRaitingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :raiting, :integer
  end
end
