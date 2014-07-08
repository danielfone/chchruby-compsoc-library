CompsocLibrary::Application.routes.draw do
  root to: 'books#index'
  resources :books do
    collection do
      get :search
    end
    member do
      post :issue
      post :return
    end
  end
  resources :borrowers do
    member do
      get :loans
    end
  end
end
