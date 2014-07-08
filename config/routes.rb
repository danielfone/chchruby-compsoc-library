CompsocLibrary::Application.routes.draw do
  root to: 'books#index'
  resources :books do
    member do
      post :issue
    end
  end
  resources :borrowers do
    member do
      get :loans
    end
  end
end
