class AddSenderNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :unread, :boolean
    add_column :messages, :recipient_id, :integer
  end
end
