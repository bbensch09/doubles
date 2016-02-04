class AddSenderNameToMessages < ActiveRecord::Migration
  def change
    add_column :users, :last_pageview_at, :datetime
    add_column :messages, :recipient_id, :integer
  end
end
