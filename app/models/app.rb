class App < ActiveRecord::Base
  attr_accessible :play_store_id, :name

  has_many :data_points

  def get_data_points(start_time = Time.zone.now - 5.days, end_time = Time.zone.now)
    return DataPoint.where('app_id = ? and created_at between ? and ?', self.id, start_time, end_time).collect { |dp|
      {
        'id' => dp.id,
        'rating_distribution' => dp.rating_distribution,
        'rating' => dp.rating,
        'num_of_ratings' => dp.num_of_ratings,
        'created_at' => dp.created_at
      }
    }
  end
end