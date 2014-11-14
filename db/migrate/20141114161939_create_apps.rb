class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :skill
      t.string :video_link
      t.string :web_link
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
