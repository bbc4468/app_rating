class IndexDataPointsRatingDistribution < ActiveRecord::Migration
  def up
    execute "CREATE INDEX data_points_rating_distribution ON data_points USING GIN(rating_distribution)"
  end

  def down
    execute "DROP INDEX data_points_rating_distribution"
  end
end
