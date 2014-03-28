AppRating::Application.routes.draw do

  get 'apps' => 'apps#index'
  get 'apps/:id' => 'apps#show'

  get '/apps/:app_id/data_points' => 'apps#get_data_points'
end
