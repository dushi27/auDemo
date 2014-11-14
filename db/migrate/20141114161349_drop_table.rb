class DropTable < ActiveRecord::Migration
  def change
    drop_table :apps
  end
end
