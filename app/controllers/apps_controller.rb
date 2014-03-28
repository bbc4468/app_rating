class AppsController < ApplicationController

  def index
  end

  def show
    @app = App.find(params[:id])
    @data_points = @app.get_data_points
  end

  def get_data_points
    app_id = params[:app_id].to_i
    @app = App.find(app_id)

    @data_points = @app.get_data_points

    render :json => @data_points, :status => 200, :callback => params[:callback]
  end

end