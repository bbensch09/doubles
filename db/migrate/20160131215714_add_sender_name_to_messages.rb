class AddSenderNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender_name, :string
  end
end
