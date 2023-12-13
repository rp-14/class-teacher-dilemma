Rails.application.routes.draw do
  namespace :api do
    resources :scorecards, only: [:index]
  end

resources :student_score
resources :students
resources :scorecards
resources :grade_reports


namespace :api do
  resources :grade_reports, only: :index
end

end
