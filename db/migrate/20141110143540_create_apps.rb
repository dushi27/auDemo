class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :catagory
      t.string :sub_catagory
      t.text :notes

      t.timestamps
    end
  end
end
