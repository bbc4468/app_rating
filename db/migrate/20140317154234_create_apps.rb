class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :play_store_id
      t.string :name
    end

    add_index :apps, :play_store_id
  end
end
