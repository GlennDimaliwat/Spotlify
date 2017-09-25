class RemoveCountFromPlayCounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :play_counts, :count, :integer
  end
end
