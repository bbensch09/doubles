class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :swiper_id, null: false
      t.integer :swipee_id, null: false
      t.boolean :swiped_yes, null: false
      t.timestamps null: false



    end
  end
end
