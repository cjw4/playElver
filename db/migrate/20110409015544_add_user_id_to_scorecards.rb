class AddUserIdToScorecards < ActiveRecord::Migration
  def self.up
    add_column :scorecards, :user_id, :integer
  end

  def self.down
    remove_column :scorecards, :user_id
  end
end
