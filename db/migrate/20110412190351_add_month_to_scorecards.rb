class AddMonthToScorecards < ActiveRecord::Migration
  def self.up
    add_column :scorecards, :month, :integer
  end

  def self.down
    remove_column :scorecards, :month
  end
end
