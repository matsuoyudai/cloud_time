Rails.application.routes.draw do

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'homes/top'
    resources :users, only:[:index, :show]
    resources :vacations, only:[:index, :create, :destroy]
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
    resources :attendances, only: [:index]
    resources :attendance_schedules, only: [:index, :new, :show, :create, :update] do
      member do
        patch :leave
      end
      collection do
        post :create_attendance
      end
    end
    resources :users, only: [:index, :update]
  end

end
