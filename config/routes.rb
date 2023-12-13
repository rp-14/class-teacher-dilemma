# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    resources :scorecards, only: [:index]
  end

namespace :api do
  resources :grade_reports, only: :index
end

end
