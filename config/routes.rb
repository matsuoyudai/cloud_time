Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'homes/top'
    resources :users, only:[:index, :show]
    resources :vacations, only:[:index, :create, :update]
    resources :applys, only: [:index,:show] #do
      #collection do
        #update :approve
      #end
    #end
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  scope module: :users do
    root 'homes#top'
    get "attendances/index", as: "attendance"
    resources :attendance_schedules, only: [:index, :show]
    resources :users, only: [:index, :update]
  end

end
