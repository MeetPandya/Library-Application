Rails.application.routes.draw do
  resources :bookings ,path_names: { find: 'find/:id' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :rooms
  get 'bookings/find/:id' => 'bookings#find',as: 'find_booking'
  get 'bookings/showUserBooking/:id' => 'bookings#showUserBooking' ,as: 'show_user_booking'
  get 'bookings/showBookingHistory/:id' => 'bookings#showBookingHistory' ,as: 'show_booking_history'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
