Rails.application.routes.draw do
  devise_for :users
  root    'tweets#index'
  get           'tweets' => 'tweets#index'
  get       'tweets/new' => 'tweets#new'
  delete   'tweets/:id'  => 'tweets#destroy'
  post          'tweets' => 'tweets#create'
  get  'tweets/:id/edit' => 'tweets#edit'
  patch    'tweets/:id'  => 'tweets#update'
  get     'tweets/battle'=> 'tweets#battle'
  get     'users/:id'    => 'users#show'
end
