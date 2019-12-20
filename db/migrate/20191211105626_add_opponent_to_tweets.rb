class AddOpponentToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :opponent, :text
  end
end
