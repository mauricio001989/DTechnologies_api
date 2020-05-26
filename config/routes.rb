Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users

    resources :projects do
      resources :tasks
    end
    resources :tasks, only: [] do
      resources :comments
    end

    resources :binarys, only: %i[show]
  end
end
