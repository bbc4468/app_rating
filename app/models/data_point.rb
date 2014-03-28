class DataPoint < ActiveRecord::Base
  attr_accessible :installs, :size, :price, :rating_distribution, :rating, :num_of_ratings, :app_id, :created_at

  serialize :rating_distribution, ActiveRecord::Coders::Hstore

  belongs_to :app

  validates_presence_of :app_id

  def self.get_data_points
    min_time_interval_between_data_points = 23.hours

    App.all.each do |app|
      dp = DataPoint.where(:app_id => app.id).order('created_at DESC').first
      if dp.nil? or dp.created_at < Time.zone.now - min_time_interval_between_data_points
        market_bot = MarketBot::Android::App.new(app.play_store_id)
        market_bot.update

        rating = 0.0
        num_of_ratings = 0
        market_bot.rating_distribution.each do |k,v|
          rating += k * v
          num_of_ratings += v
        end
        rating = 1.0000 * rating / num_of_ratings

        new_dp = DataPoint.create(:app_id => app.id, :installs => market_bot.installs, :size => market_bot.size.to_f, :price => market_bot.price.to_f, :rating_distribution => market_bot.rating_distribution, :created_at => Time.zone.now, :rating => rating, :num_of_ratings => num_of_ratings)
      end
    end
  end

end