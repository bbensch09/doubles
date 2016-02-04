class AddSportNameToActivityBlurbs < ActiveRecord::Migration
  def change
    add_column :activity_blurbs, :sport, :string
  end
end
