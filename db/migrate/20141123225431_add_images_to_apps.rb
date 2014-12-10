class AddImagesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :images, :text
  end
end
