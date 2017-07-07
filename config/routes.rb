Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do  
    resources :login  do 
      collection do
        get   :user_data_trial
        post  :user_data
        post  :otp_check
      end
    end
    resources :game  do 
      collection do
        get   :list
        get   :intro
        get   :start
        post  :submit
      end
    end
  end
end
