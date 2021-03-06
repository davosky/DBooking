# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :big_rooms do
    collection do
      get :mobile_index
      get :index_regular
    end
  end
  resources :small_rooms do
    collection do
      get :mobile_index
      get :index_regular
    end
  end
  resources :meeting_rooms
  root to: 'home#index'
  get 'home/index'
  get 'home/howto'
  get 'home/credits'
end
