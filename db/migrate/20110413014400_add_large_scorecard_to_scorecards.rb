class AddLargeScorecardToScorecards < ActiveRecord::Migration
  def self.up
    add_column :scorecards, :large_scorecard, :boolean
  end

  def self.down
    remove_column :scorecards, :large_scorecard
  end
end
