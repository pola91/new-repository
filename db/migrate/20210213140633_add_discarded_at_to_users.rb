class AddDiscardedAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :discarded_at, :datetime
    add_column :users, :archiver_id, :integer
    add_index :users, :discarded_at
  end
end
