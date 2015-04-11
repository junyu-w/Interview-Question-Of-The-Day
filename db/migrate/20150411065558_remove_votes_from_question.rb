class RemoveVotesFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :votes, :integer
  end
end
