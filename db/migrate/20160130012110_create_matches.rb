class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_user_id, null: false
      t.integer :second_user_id, null: false
      t.timestamps null: false
    end
  end
end
