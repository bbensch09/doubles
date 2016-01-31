class CreateActivityBlurbs < ActiveRecord::Migration
  def change
    create_table :activity_blurbs do |t|
      t.references :user, null: false
      t.references :activity, null: false
      t.text :text
      t.timestamps null: false
    end
  end
end
