class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|

      t.string :installs
      t.float :size
      t.float :price
      t.hstore :rating_distribution
      t.integer :app_id
      t.float :rating
      t.integer :num_of_ratings

      t.datetime :created_at
    end

    add_index :data_points, :app_id
    add_index :data_points, :created_at
  end
end
