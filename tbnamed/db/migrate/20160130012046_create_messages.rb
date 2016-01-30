class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :match, null: false
      t.text :message_text, null: false
      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
