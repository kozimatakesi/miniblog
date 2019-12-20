class AddWinerToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :winer, :text
  end
end
